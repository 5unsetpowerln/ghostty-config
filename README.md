# tmux-like feel

Keybindings are set up so that Ghostty feels like tmux.
Ghostty does not support splitting the whole window, so that is dropped for now.
Every shell is started inside tmux, which means a new pane no longer inherits the working directory. To fix that, fish and tmux are tweaked so that the current directory is passed through tmux to Ghostty.
Ghostty does not support moving a pane either, but that is solved by swapping the tmux sessions of two panes.

## Installation

```sh
mkdir -p ~/.config/ghostty ~/.config/fish/conf.d ~/.tmux
cp ghostty/config ghostty/style.css ~/.config/ghostty/
cp fish/tmux-osc7-passthrough.fish ~/.config/fish/conf.d/
cp tmux/ghostty-swap.sh ~/.tmux/
cat tmux/tmux.conf >> ~/.tmux.conf
```

tmux needs `focus-events on` for the pane swap (tmux-sensible sets it).
