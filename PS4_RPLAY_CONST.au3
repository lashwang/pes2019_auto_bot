#AutoIt3Wrapper_UseX64=n ; In order for the x86 DLLs to work
#include-once

; >>>> Window <<<<
; Title:	PS4遥控操作
; Class:	WindowsForms10.Window.8.app.0.141b42a_r9_ad1
; Position:	387, 15
; Size:	893, 634
; Style:	0x16CF0000
; ExStyle:	0x00050100
; Handle:	0x00090B28

; >>>> Control <<<<
; Class:	WindowsForms10.Window.8.app.0.141b42a_r9_ad1
; Instance:	1
; ClassnameNN:	WindowsForms10.Window.8.app.0.141b42a_r9_ad11
; Name:	ViewPanel
; Advanced (Class):	[NAME:ViewPanel]
; ID:	723132
; Text:
; Position:	0, 0
; Size:	878, 597
; ControlClick Coords:	78, 26
; Style:	0x56000000
; ExStyle:	0x00010000
; Handle:	0x000B08BC

; >>>> Mouse <<<<
; Position:	473, 71
; Cursor ID:	0
; Color:	0xF1F3F4


Global $g_RPLAY_EXE_PATH = "C:\Program Files (x86)\Sony\PS4 Remote Play\RemotePlay.exe"
Global $g_RPLAY_EXE = "RemotePlay.exe"
Global $g_RPLAY_BTN_START = "开始"
Global $g_RPLAY_WIN_TITLE = "PS4遥控操作"
Global $g_RPLAY_WIN_GAME_EXIT_TEXT = "与PS4的连接被切断"
Global $g_RPLAY_GAME_CONTROL_CLASS = "[NAME:ViewPanel]"
Global $g_RPLAY_GAME_EXIT_CONTROL_CLASS = "[NAME:ErrorDetailLabel]"
Global $g_PS4Macro_EXE_PATH = "C:\Users\lashw\Downloads\PS4Macro_0_5_2\PS4Macro.exe"
Global $g_PS4Macro_EXE = "PS4Macro.exe"
Global $g_PS4Macro_Title = "PS4 Macro - v0.5.2 (BETA)"
Global $g_PicMatch_Threshold = 0.7
Global $g_GameLoop_WatchDogTime = (10*60) ;seconds
Global $g_log_path = @MyDocumentsDir&"\pes2019.log"


global const $GAME_STAGE_MAINMENU = 1
global const $GAME_STAGE_MATCHING = 2
global const $GAME_STAGE_AFTER_MATCH = 3
global const $IMAGE_SEARCH_SV = 5
global const $Screen_Shot_path = @MyDocumentsDir & "\pes2019\screenshot\"


Global const $g_LOADING_ICON_X = 140
Global const $g_LOADING_ICON_Y = 663
Global const $g_LOADING_ICON_W = 36
Global const $g_LOADING_ICON_H = 36


Global const $g_HTTP_SERVER_PORT = 8289









