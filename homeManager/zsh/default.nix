{
config,
pkgs,
...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = false;
    oh-my-zsh.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
        eval $(cat ${config.age.secrets.mcp.path})
        # fnm
        FNM_PATH="/opt/homebrew/opt/fnm/bin"
        if [ -d "$FNM_PATH" ]; then
          eval "`fnm env`"
        fi
        export PATH="$HOME/.local/bin:$PATH"
        export PATH="$HOME/.cargo/bin:$PATH"
        export XDG_CONFIG_HOME="$HOME/.config"
        eval "$(fnm env --use-on-cd --shell zsh)"
        #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
        export SDKMAN_DIR="/Users/dev/.sdkman"
        export ESPANSO_CONFIG_DIR="$HOME/.config/espanso"
        [[ -s "/Users/dev/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dev/.sdkman/bin/sdkman-init.sh"
        export PATH="$HOME/.config/tmux/workspaces:$PATH"
    '';
  };
}
