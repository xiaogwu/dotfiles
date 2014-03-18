#!/usr/bin/env sh
tmux has-session -t development
if [ $? != 0 ]; then
  tmux new-session -s development -n server -d
  tmux send-keys 'cd ~/SFDC' C-m
  tmux split-window -v -t development
  tmux send-keys -t development:1.2 'cd ~/SFDC' C-m
  tmux new-window -n console -t development
  tmux send-keys -t development:2 'cd ~/SFDC' C-m
  tmux new-window -n editor -t development
  tmux send-keys -t development 'cd ~/SFDC' C-m
  tmux send-keys -t development 'vim' C-m
  tmux split-window -v -p 10 -t development
  tmux send-keys -t development:3.2 'cd ~/SFDC' C-m
  tmux select-window -t development:3
  tmux select-pane -U
  tmux attach -t development
fi
tmux attach -t development
