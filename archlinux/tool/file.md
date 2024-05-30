## trash
```sh
pacman -S trash-cli
 # /home/siuoly/.local/share/Trash
trash FILE
trash-restore FILE
```

## yazi
```sh
pacman -S yazi
 # config folder
  /home/siuoly/.config/yazi
├──  flavors
├──  keymap.toml
├──  theme.toml
├──  yazi.toml
├──  keymap.toml.bak
└──  plugins
 # default https://github.com/sxyazi/yazi/tree/latest/yazi-config/preset


 # .zshrc for moving to focusing directory when exit.
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
```

- ~  > help
