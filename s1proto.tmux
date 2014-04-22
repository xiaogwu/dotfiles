#!/usr/bin/env sh
tmux has-session -t s1proto
if [ $? != 0 ]; then
  # Create new session and create first window for server tasks
  tmux new-session -s s1proto -n server -d
  tmux send-keys 'cd ~/SFDC/forked/s1proto' C-m
  # Start app server
  tmux send-keys 'coffee app.coffee' C-m
  # Split window for grunt task
  tmux split-window -v -t s1proto
  tmux send-keys -t s1proto:1.2 'cd ~/SFDC/forked/s1proto' C-m
  tmux send-keys 'grunt clean' C-m
  tmux send-keys 'grunt' C-m
  # Create new window for editor task
  tmux new-window -n editor -t s1proto
  tmux send-keys -t s1proto 'cd ~/SFDC/forked/s1proto' C-m
  tmux send-keys -t s1proto 'vim src' C-m
  # Create new window for console task
  tmux new-window -n console -t s1proto
  tmux send-keys 'cd ~/SFDC/forked/s1proto' C-m
  # Select editor window
  tmux select-window -t s1proto:2
  # Attach to session
  tmux attach -t s1proto
fi
tmux attach -t s1proto
