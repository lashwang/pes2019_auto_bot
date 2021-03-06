#AutoIt3Wrapper_UseX64=n ; In order for the x86 DLLs to work
#include-once

#include <Timers.au3>
#include <ScreenCapture.au3>
#include <GUIConstantsEx.au3>
;#include <ImageSearch.au3>
#include <Date.au3>
#include <Array.au3>
#include <StringConstants.au3>
#include "log4a.au3"
#include "OpenCV-Match_UDF.au3"
#include "TCPServer.au3"
#include "PS4_RPLAY_CONST.au3"
#include "PS4_KeyAPI.au3"
#include "Utils.au3"
#include "PS4_Rplay_GameWindow.au3"
#include "PES2019_GameResource.au3"
#include "HotKeyMgr.au3"
#include "SmtpMailer.au3"
#include "PES2019_WatchDog.au3"
#include "PES2019_SquadSelect.au3"
#include "PES2019_MatchLoop.au3"
#include "PES2019_Mainmenu.au3"
#include "PES2019_ScoutsSold.au3"
#include "PES2019_AutoChangePlayer.au3"
#include "HTTP_SERVER.au3"


_log4a_SetEnable()
_log4a_SetOutput($LOG4A_OUTPUT_BOTH)
DllCall("User32.dll","bool","SetProcessDPIAware")
DirCreate($Screen_Shot_path)
_OpenCV_Startup();loads opencv DLLs
_GameResource_Startup()
_KeyMap_Startup()
_squad_select_startup()
;_PS4_HotKey_Init()
_log4a_SetLogFile($g_log_path)
start_watch_dog()

Func reset_log_file()
	$hFO = FileOpen($g_log_path, 2)
	if @error then
		return
	endif
	FileWrite($hFO, "")
	FileClose($hFO)
EndFunc




