#Execute ls when cwd has changed
chpwd() {emulate -L zsh; ls -A}  # Show content after cd
echo -ne '\e[?12h'               # Cursor blinking
