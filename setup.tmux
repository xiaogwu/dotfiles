#!/usr/bin/env sh
tmux has-session -t setup
if [ $? != 0 ]; then
  tmux new-session -s setup -n server -d
  tmux send-keys 'cd ~/SFDC/forked/s1proto' C-m
  tmux send-keys 'coffee app.coffee' C-m
  tmux split-window -v -t setup
  tmux send-keys -t setup:1.2 'cd ~/SFDC/forked/s1proto' C-m
  tmux send-keys 'grunt clean' C-m
  tmux send-keys 'grunt' C-m
  tmux new-window -n console -t setup
  tmux send-keys -t setup:2 'cd ~/SFDC/forked/s1proto' C-m
  tmux new-window -n editor -t setup
  tmux send-keys -t setup 'cd ~/SFDC/forked/s1proto' C-m
  tmux send-keys -t setup 'vim src' C-m
  tmux split-window -v -p 10 -t setup
  tmux send-keys -t setup:3.2 'cd ~/SFDC/forked/s1proto' C-m
  tmux select-window -t setup:3
  tmux select-pane -U
  tmux attach -t setup
fi
tmux attach -t setup
