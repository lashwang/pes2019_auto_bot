#AutoIt3Wrapper_UseX64=n ; In order for the x86 DLLs to work
#include-once
Global $g_hwnd_rplay = 0
Global $g_rplay_started = False
Global const $g_WindowPosX = 291
Global const $g_WindowPosY = 141
Global const $g_WindowWidth = 1306
Global const $g_WindowHight = 779


#include "IncludeCommon.au3"




Func _PS4_GameWindow_StartUp()
    if Not WinExists($g_RPLAY_WIN_TITLE) Then
        If ProcessExists($g_RPLAY_EXE) then
            ProcessClose($g_RPLAY_EXE)
            Sleep(2000)
        endif
    endif

    ;如果RPLAY没有打开
    If Not ProcessExists($g_RPLAY_EXE) Then
        ProcessClose($g_PS4Macro_EXE)
        Sleep(1000)
        Run($g_RPLAY_EXE_PATH)
        $hWnd = WinWaitActive($g_RPLAY_WIN_TITLE,$g_RPLAY_BTN_START,120)
        If $hWnd == 0 Then
            _log4a_Info("Open PS4 remote timeout")
            Exit 0
        EndIf
    EndIf

    _log4a_Info("PS4 Game Window Starting")

    AdlibRegister("GameWindowCheck",5*1000)

    If WinExists($g_RPLAY_WIN_TITLE,$g_RPLAY_BTN_START) Then
		$hWnd = WinActivate($g_RPLAY_WIN_TITLE)
        Sleep(1*1000)
        _log4a_Info("Waiting for the start button press")
        ControlClick($hWnd, "",$g_RPLAY_BTN_START)
        Sleep(1*1000)
    endif

    $hCtrl = ControlGetHandle($g_RPLAY_WIN_TITLE, "", $g_RPLAY_GAME_CONTROL_CLASS)
    If Not $hCtrl Then
        AdlibRegister("onViewPanelCheck",1*1000)
        While not $g_rplay_started
            Sleep(1*1000)
        WEnd
        AdlibUnRegister("onViewPanelCheck")
    Endif

    Sleep(10*1000)
    $g_rplay_started = True
    SetFocusWindow()
    $g_hwnd_rplay = WinWaitActive($g_RPLAY_WIN_TITLE,"",120)
    WinMove($g_RPLAY_WIN_TITLE,"",$g_WindowPosX,$g_WindowPosY,$g_WindowWidth,$g_WindowHight)
    _log4a_Info("PS4 Game Window Start compelete,hwnd="&$g_hwnd_rplay)
EndFunc

Func onViewPanelCheck()
	_log4a_Info("onViewPanelCheck");
	If not $g_rplay_started And WinExists($g_RPLAY_WIN_TITLE) Then
		$hCtrl = ControlGetHandle($g_RPLAY_WIN_TITLE, "", $g_RPLAY_GAME_CONTROL_CLASS)
		If $hCtrl Then
			; we got the handle, so the button is there
			; now do whatever you need to do
			_log4a_Info("Find Viewpanel!!!");
			$g_rplay_started = True
		EndIf
	EndIf
EndFunc


Func GameWindowCheck()
    Local static $now = _NowCalc()

    If not ProcessExists($g_RPLAY_EXE) Then
		_log4a_Info("Process exited,stop!!!!")
		exit 0
	endif
    CheckInvalidWindow()
    Local $aPos = WinGetPos($g_RPLAY_WIN_TITLE)
    ;_log4a_Info("X-Pos: "&$aPos[0]&"Y-Pos: "&$aPos[1]&"Width: "&$aPos[2]&"Height: "&$aPos[3])
    Local $time_diff = _NowCalc() - $now
    WinMove($g_RPLAY_WIN_TITLE,"",$aPos[0],$aPos[1],$g_WindowWidth,$g_WindowHight)
    if $time_diff > 60 then
        $now = _NowCalc()
        WinActivate($g_RPLAY_WIN_TITLE)
    endif
EndFunc

Func PS4MacroWindowStart()
    If ProcessExists($g_PS4Macro_EXE) Then
        ProcessClose($g_PS4Macro_EXE)
        Sleep(2000)
    endif
    Run($g_PS4Macro_EXE_PATH)
    Sleep(1000)
EndFunc


Func SetFocusWindow()
    WinActivate($g_RPLAY_WIN_TITLE)
    Sleep(200)
    CheckInvalidWindow()
    Local $aPos = WinGetPos($g_RPLAY_WIN_TITLE)
    WinMove($g_RPLAY_WIN_TITLE,"",$g_WindowPosX,$g_WindowPosY,$g_WindowWidth,$g_WindowHight)
EndFunc

Func GetScreenSnapshot($hwnd = 0)
    Local $hBitmap
    if hwnd == 0 then
        $hBitmap = _ScreenCapture_CaptureWnd("", $g_hwnd_rplay)
    else
        $hBitmap = _ScreenCapture_CaptureWnd("", $hwnd)
    endif
    return $hBitmap
EndFunc


Func GetPS4RemoteWindowHandler()
    Local $hwnd
    SetFocusWindow()
    $hwnd = WinWaitActive($g_RPLAY_WIN_TITLE,"",120)

    return $hwnd
EndFunc

Func GetPS4WindowPos()
    Local $aPos = WinGetPos($g_RPLAY_WIN_TITLE)
    ;_log4a_Info("GetPS4WindowPos,x="&$aPos[0]&",y="&$aPos[1])
    return $aPos
EndFunc


