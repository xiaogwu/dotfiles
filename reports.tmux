#!/usr/bin/env sh
tmux has-session -t reports
if [ $? != 0 ]; then
  tmux new-session -s reports -n server -d
  tmux send-keys 'cd ~/SFDC/s1proto' C-m
  tmux send-keys 'coffee app.coffee' C-m
  tmux split-window -v -t reports
  tmux send-keys -t reports:1.2 'cd ~/SFDC/s1proto' C-m
  tmux send-keys 'grunt clean' C-m
  tmux send-keys 'grunt' C-m
  tmux new-window -n console -t reports
  tmux send-keys -t reports:2 'cd ~/SFDC/s1proto' C-m
  tmux new-window -n editor -t reports
  tmux send-keys -t reports 'cd ~/SFDC/s1proto' C-m
  tmux send-keys -t reports 'vim src' C-m
  tmux split-window -v -p 10 -t reports
  tmux send-keys -t reports:3.2 'cd ~/SFDC/s1proto' C-m
  tmux select-window -t reports:3
  tmux select-pane -U
  tmux attach -t reports
fi
tmux attach -t reports
