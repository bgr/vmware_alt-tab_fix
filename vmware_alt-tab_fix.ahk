SetTitleMatchMode RegEx
SendMode Input
SetWinDelay, 0
;SetControlDelay, 0

; Edit the text between the brackets below to match your VM name
TitleRegex := ".* - \[Ubuntu 64-bit\].*"

Loop {
	WinWaitActive, %TitleRegex%

	GetKeyState, MouseState, LButton
	WinGetActiveTitle, WinTitle

	; Focusing works correctly when done by mouse, so the script should do
	; nothing (it would actually cause problems because it'd behave like a
	; mouse drag)

	if MouseState = U
	{
		; Move the mouse to window's title-bar so that the upcoming click
		; doesn't actually click anything inside the window
		MouseGetPos, Mx, My
		MouseMove, 0, 0

		; MKSEmbedded1 is the window class name, found using Window Spy
		ControlClick, MKSEmbedded1, %WinTitle%

		; Move the mouse back to the original position
		MouseMove, %Mx%, %My%
	}

	; Pause the loop until next window switch
	WinWaitNotActive, %WinTitle%
}