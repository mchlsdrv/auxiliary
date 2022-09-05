#!/bin/bash

devbrd () {
	
	SESSION_NAME=$1
	
	echo "Date: $(date)"
	echo "Creating a new dev board - $SESSION_NAME"

	# Create a new session and call it by the provided name
	tmux new-session -d -s $SESSION_NAME

	# Create panes
	tmux split-window -h
	tmux split-window -v
	tmux select-pane -t 0
	tmux split-window -v

	# GPU monitor
	tmux select-pane -t 2
	tmux send-keys "watch -n 1 nvidia-smi" Enter

	# Processes monitor
	tmux select-pane -t 3
	tmux send-keys "htop" Enter

	# Move to the first pane
	tmux select-pane -t 0

	# Attatch the session
	tmux attach -t $SESSION_NAME

}
