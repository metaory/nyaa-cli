Output .github/demos/state.gif
Require nyaa-cli

Set TypingSpeed 80ms

Set Shell "bash"
Set FontSize 24
Set BorderRadius 20
Set Width 1200
Set Height 1600
Set Margin 80
Set MarginFill "#111122"
Set Padding 30
Set Theme "Dark Pastel"
Set WindowBar Colorful
Set WindowBarSize 80

Type "clear" Enter

Type "Continue downloading One Piece from the last watched episode" Sleep 4s Ctrl+a Ctrl+k

Type "grep piece <  ~/.local/state/nyaa-cli/progress" Sleep 2s Enter Sleep 4s Enter

Type "nyaa-cli --name 'one piece'" Sleep 3s Enter
Sleep 30s 