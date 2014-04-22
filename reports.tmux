#!/usr/bin/env sh
tmux has-session -t reports
if [ $? != 0 ]; then
  # Create new session and create first window for server tasks
  tmux new-session -s reports -n server -d
  tmux send-keys 'cd ~/SFDC/s1proto' C-m
  # Start app server
  tmux send-keys 'coffee app.coffee' C-m
  # Split window for grunt task
  tmux split-window -v -t reports
  tmux send-keys -t reports:1.2 'cd ~/SFDC/s1proto' C-m
  tmux send-keys 'grunt clean' C-m
  tmux send-keys 'grunt' C-m
  # Create new window for editor task
  tmux new-window -n editor -t reports
  tmux send-keys -t reports 'cd ~/SFDC/s1proto' C-m
  tmux send-keys -t reports 'vim src' C-m
  # Create new window for console task
  tmux new-window -n console -t reports
  tmux send-keys 'cd ~/SFDC/s1proto' C-m
  # Select editor window
  tmux select-window -t reports:2
  # Attach to session
  tmux attach -t reports
fi
tmux attach -t reports
