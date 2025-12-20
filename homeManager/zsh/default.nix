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
        source ${./extra.zsh}
    '';
  };
}
