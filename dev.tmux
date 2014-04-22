#!/usr/bin/env sh
tmux has-session -t dev
if [ $? != 0 ]; then
  # Create new session and create first window for server tasks
  tmux new-session -s dev -n server -d
  tmux send-keys 'cd ~/dev' C-m
  # Start app server
  #tmux send-keys 'coffee app.coffee' C-m
  # Split window for grunt task
  tmux split-window -v -t dev
  tmux send-keys -t dev:1.2 'cd ~/dev' C-m
  #tmux send-keys 'grunt clean' C-m
  #tmux send-keys 'grunt' C-m
  # Create new window for editor task
  tmux new-window -n editor -t dev
  tmux send-keys -t dev 'cd ~/dev' C-m
  tmux send-keys -t dev 'vim' C-m
  # Create new window for console task
  tmux new-window -n console -t dev
  tmux send-keys 'cd ~/dev' C-m
  # Select editor window
  tmux select-window -t dev:2
  # Attach to session
  tmux attach -t dev
fi
tmux attach -t dev
