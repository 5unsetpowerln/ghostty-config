#!/bin/bash
# Swap the tmux sessions shown in two Ghostty panes (each pane is a tmux
# client). $1 is the client that asked to be moved; the other one is the
# client Ghostty focuses right after (recorded by the client-focus-in hook).
src=$1
sleep 0.1 # let the focus event of the neighbouring pane arrive
dst=$(tmux show -sv @ghostty-focus-client)
[ -z "$dst" ] || [ "$dst" = "$src" ] && exit 0

session_of() { tmux list-clients -F '#{client_name} #{session_id}' | awk -v c="$1" '$1 == c { print $2 }'; }
src_session=$(session_of "$src")
dst_session=$(session_of "$dst")
[ -z "$src_session" ] || [ -z "$dst_session" ] && exit 0

tmux switch-client -c "$src" -t "$dst_session" \; switch-client -c "$dst" -t "$src_session"
