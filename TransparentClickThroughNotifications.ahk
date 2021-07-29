#NoTrayIcon

Hotstring(":X?*:cooltestnotification", "TestNotification") ;type "cooltestnotification" anywhere to get a test notification
Hotstring(":X?*:coolexitnotification", "Exit") ;type "coolexitnotification" anywhere to exit script

if(!(_HWND := DllCall("FindWindow", Str, "Windows.UI.Core.CoreWindow", Str, "New notification", Ptr))) ;get the HWND of our notification window
{
	MsgBox, 0x40015, Error, % "I was unable to find the notification window for whatever reason..  :*(`n`nMaybe you've yet to receive a Windows notification? That'll cause me to be unable to modify the notification window since it doesn't exist yet.`n`nIf that's the case, type ""cooltestnotification"" anywhere on your computer to get a test notification, then retry."
	IfMsgBox, Retry
		Reload
	else
		ExitApp
}

SetTransparency(150, true) ;turns it on with a transparency degree of 150
Success()

^END::SetTransparency() ;Ctrl+END to toggle on off, change to w/e you want.

/*
;Examples of adding other hotkeys
F6::SetTransparency(50) ;toggle on off with transparency degree of 50
F7::SetTransparency(200, true) ;turn on with transparency degree of 200
F8::SetTransparency(, false) ;turn off
*/

;Param1: Set your degree of transparency (scale 0-255 (transparent-opaque)), or omit and the default value of 150 will be used
;Param2: Turn on (true or 1), turn off (false or 0), or toggle (string "toggle"), or omit and it will toggle by default
SetTransparency(TransparencyDegree := 150, OnOffToggle := "toggle") 
{
	static state := false
	global _HWND
	WinSet, ExStyle, % (OnOffToggle = "toggle" ? "^" : (OnOffToggle ? "+" : "-")) "0x80020", % "ahk_id " _HWND ;Toggle, set, or remove the the WS_EX_LAYER (0x80000) and WS_EX_TRANSPARENT (0x20) extended styles
	Winset, Transparent, % OnOffToggle = "toggle" ? ((state ? "Off" : TransparencyDegree), state := !state) : (OnOffToggle ? (TransparencyDegree, state := true) : ("Off", state := false)), % "ahk_id " _HWND ;toggle, set, or remove transparency
}

TestNotification()
{
	Menu, Tray, Icon ;cant send notifications without a tray icon
	TrayTip, % "Hello", % "This is your test notification!"
	Menu, Tray, NoIcon
}

Success()
{
	Menu, Tray, Icon 
	TrayTip, % "Success", % "Transparent click-through notifications should now be enabled!"
	Menu, Tray, NoIcon
}

Exit()
{
	SetTransparency(, false)
	ExitApp
}