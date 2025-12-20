mux() {
  if [ -z "$1" ]; then
    echo "Usage: tmux_start <project_name>"
    return 1
  fi
  local project="$1"
  if ! tmux has-session -t "$project" 2>/dev/null; then
    tmuxinator start "$project" && sleep 2
  fi
  tmux attach -t "$project"
}

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
eval "$(fnm env --use-on-cd --shell zsh)"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dev/.sdkman"
export ESPANSO_CONFIG_DIR="$HOME/.config/espanso"
[[ -s "/Users/dev/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dev/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.config/tmux/workspaces:$PATH"
