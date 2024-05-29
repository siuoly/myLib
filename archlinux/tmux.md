### pane
set -g pane-border-status top # top,bottom,off
set -g pane-border-format "#{pane_index} #{pane_title}"
<!-- bind command prompt https://unix.stackexchange.com/questions/564618/set-tmux-pane-title-to-user-defined-if-exists-else-current-working-file-or-dire -->
bind . command-prompt -p "(rename-pane)" -I "#T" "select-pane -T '%%'"

### window
prefix . # move window
