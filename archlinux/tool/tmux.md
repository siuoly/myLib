
## plugin
install tpm:
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
> add following to ~/.tmux.conf
```sh
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

### pane
set -g pane-border-status top # top,bottom,off
set -g pane-border-format "#{pane_index} #{pane_title}"
<!-- bind command prompt https://unix.stackexchange.com/questions/564618/set-tmux-pane-title-to-user-defined-if-exists-else-current-working-file-or-dire -->
bind . command-prompt -p "(rename-pane)" -I "#T" "select-pane -T '%%'"

### window
prefix . # move window

## sync
setw synchronize-panes  # toggle sync pane feature
