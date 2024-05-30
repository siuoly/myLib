
[kitty hotkey] https://sw.kovidgoyal.net/kitty/overview/

# hotkey
Previous shell prompt
ctrl+shift+z (see Shell integration)

Next shell prompt
ctrl+shift+x (see Shell integration)

Browse scrollback in less
ctrl+shift+h

Browse last cmd output
ctrl+shift+g (see Shell integration)

rext tab
ctrl+shift+right (also ⌃+⇥ and ⇧+⌘+] on macOS)

Previous tab
ctrl+shift+left (also ⇧+⌃+⇥ and ⇧+⌘+[ on macOS)

Next layout
ctrl+shift+l

Move tab forward
ctrl+shift+.

Move tab backward
ctrl+shift+,

Set tab title
ctrl+shift+alt+t (also ⇧+⌘+i on macOS)

New window
ctrl+shift+enter (also ⌘+↩ on macOS)

New OS window
ctrl+shift+n (also ⌘+n on macOS)

Close window
ctrl+shift+w (also ⇧+⌘+d on macOS)

Resize window
ctrl+shift+r (also ⌘+r on macOS)

Next window
ctrl+shift+]

Previous window
ctrl+shift+[

Move window forward
ctrl+shift+f

Move window backward
ctrl+shift+b

Move window to top
ctrl+shift+`

Visually focus window
ctrl+shift+f7

Visually swap window
ctrl+shift+f8

Focus specific window
ctrl+shift+1, ctrl+shift+2 … ctrl+shift+0 (also ⌘+1, ⌘+2 … ⌘+9 on macOS) (clockwise from the top-left)

ctrl+shift+u 2717 [enter] 

# kitten
`kitten unicode-input`

kitten ssh -p PORT HOST

kitten icat IAMGE_PATH
kitten icat 'https://cache.ptt.cc/c/https/i.imgur.com/WzZT8nVl.jpeg?e=1715409026&s=Bubj1UCm3dovzOapbRs34g'

kitten @ launch COMMAND
## edit current scroll buffer on nvim
kitten @ launch --type=overlay --stdin-source=@screen_scrollback nvim -c "set scl=no nonu|norm G" 
>> note: need enable **allow_remote_control yes**

vim:nospell nonu
