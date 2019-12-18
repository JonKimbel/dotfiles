# Creates a tmux session (if necessary)
# and then opens the session.
function goto {
  tmux new-session -s "$1"
  tmux attach -t "$1"
}

# Kills the current session.
function ks {
  tmux kill-sess
}
