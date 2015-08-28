SetTitleMatchMode RegEx
SendMode Input
SetWinDelay, 150

TitleRegex := ".* - \[Ubuntu 64-bit\].*"

Loop {
	WinWaitActive, %TitleRegex%
	
	KeyWait, LButton, U

	MouseGetPos, Mx, My
	Click 10, 10
	Sleep, 75
	MouseMove, %Mx%, %My%
		
	WinWaitNotActive, %TitleRegex%
}