# tmux swallows the OSC 7 that fish emits, so the outer terminal (Ghostty)
# never learns the current directory. Resend it through tmux passthrough.
# Requires `set -g allow-passthrough on` in tmux.
if status is-interactive; and set -q TMUX
    function __tmux_forward_cwd --on-variable PWD --on-event fish_focus_in
        status is-command-substitution; and return
        printf '\ePtmux;\e\e]7;file://%s%s\a\e\\' $hostname (string escape --style=url -- $PWD)
    end
    __tmux_forward_cwd
end
