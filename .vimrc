###########################
#  Configuration
###########################

# use 256 term for pretty colors
set -g default-terminal "screen-256color"


# increase scroll-back history
set -g history-limit 5000

# set Ctrl-a as the default prefix key combination
# and unbind C-b to free it up
set -g prefix C-a
unbind C-b

# split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# move pbpaste into tmux paste buffer
bind C-v run "tmux set-buffer \"$(pbpaste -o)\"; tmux paste-buffer"
# move tmux copy buffer into pbcopy
bind C-c run "tmux save-buffer - | pbcopy -selection c"\; display-message "Buffer copied to clipboard"

bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection

# decrease command delay (increases vim responsiveness)
set -sg escape-time 1

# increase repeat time for repeatable commands
set -g repeat-time 1000

# start window index at 1
set -g base-index 1

# start pane index at 1
setw -g pane-base-index 1

# highlight window when it has new activity
setw -g monitor-activity on
set -g visual-activity on

set -g set-titles on
set -g set-titles-string "#T"

# not really sure what this does, but with it, the scrollwheel works inside Vim
set-option -g mouse-utf8 on

# Enable mouse mode (tmux 2.1 and above)
set -g mouse on

# allow mouse to enter copy mode and initiate selection
set-window-option -g mode-mouse on

set -g default-terminal "screen"

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

###########################
# Status Bar
###########################

# set color for status bar
set-option -g status-bg colour235 #base02
set-option -g status-fg yellow #yellow
set-option -g status-attr dim

# set window list colors - red for active and cyan for inactive
set-window-option -g window-status-fg brightblue #base0
set-window-option -g window-status-bg colour236
set-window-option -g window-status-attr dim

set-window-option -g window-status-current-fg brightred #orange
set-window-option -g window-status-current-bg colour236
set-window-option -g window-status-current-attr bright

# enable UTF-8 support in status bar
set -g status-utf8 on
set -g utf8
set-window-option -g utf8 on

# set refresh interval for status bar
set -g status-interval 30

# center the status bar
set -g status-justify left

# show session, window, pane in left status bar
set -g status-left-length 40
set -g status-left '#[fg=red]#S#[fg=blue] #I:#P#[default]'

# show hostname, date, time, and battery in right status bar
set-option -g status-right '#[fg=red]#H#[default] %m/%d/%y %I:%M\
 #[fg=red]#(battery discharging)#[default]#(battery charging)'