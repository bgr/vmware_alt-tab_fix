SendMode Input
SetWinDelay, 30
SetControlDelay, 30


; Edit the text between the brackets below to match your VM name
TitleRegex := ".* - \[Ubuntu 64-bit\].*"

Loop {
    SetTitleMatchMode RegEx
    WinWaitActive, %TitleRegex%

    GetKeyState, MouseState, LButton

    ; Focusing works correctly when done via mouse, so the script should do
    ; nothing (it would actually cause problems because it'd behave like a
    ; mouse drag)

    if MouseState = U
    {
        ; Move the mouse out of the way so that the upcoming click doesn't
        ; cause window resize which would sometimes happen for some reason
        CoordMode, Mouse, Screen
        MouseGetPos, Mx, My
        MouseMove, 0, 0

        WinGetActiveTitle, WinTitle

        ; Switching to exact match mode since some window titles could
        ; resemble a bogus regex and fail, e.g. "[No Name] - VIM"
        SetTitleMatchMode 3

        ; MKSEmbedded1 is the window class name, found using Window Spy
        ; clicking on coords 10,10 assuming it's within window's title bar
        ControlClick, MKSEmbedded1, %WinTitle%,,,, NA x10 y10

        ; Move the mouse back to the original position
        MouseMove, %Mx%, %My%
    }

    ; Pause the loop until next window switch
    ; Shouldn't use %WinTitle% here since title could've changed
    SetTitleMatchMode RegEx
    WinWaitNotActive, %TitleRegex%
}