#Execute ls when cwd has changed
chpwd() { emulate -L zsh; eza -A --icons --color=always }  # Show content after cd
echo -ne '\e[?12h'                                         # Cursor blinking
