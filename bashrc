# Set default editor
export EDITOR='nano -w'

# Shortcut for clearing the terminal.
function c {
  clear
}

# Shortcut for updating bashrc.
function bashrc {
  nano ~/dotfiles/bashrc
  source ~/.bashrc
}

# Sets the name for the terminal to whatever was passed in.
function setname {
  echo -ne "]0;$1"
}

# Serves the current directory as a website.
function servethis {
  echo "Serving current directory at $HOSTNAME, stop with Ctrl-C."; sudo python2 -m SimpleHTTPServer 9999 > /dev/null 2>&1
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TMUX shortcuts
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

# Lists all the open tmux sessions.
function s {
  tmux list-sess
}

# Detaches from the open tmux session.
function d {
  tmux detach
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Interactive command saver
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

save() {
  last_command=$(fc -ln -2 -2 | sed '1s/^[[:space:]]*//')
  echo "Function name to use?"
  read function_name
  printf "\nfunction $function_name {\n  $last_command\n}\n" >> ~/.bash_saved_commands
  . ~/.bash_saved_commands
  echo "Bashrc updated!"
}

saved() {
  if [ "$1" ]; then
    cat ~/.bash_saved_commands | pcregrep -M "^function $1.*\n.*\n}"
  else
    cat ~/.bash_saved_commands | grep -P -o "(?<=^function ).*(?= {)"
  fi
}

if [ -f ~/.bash_saved_commands ]; then
    . ~/.bash_saved_commands
fi
