{
pkgs,
lib,
...
}: {
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPath = ["/opt/homebrew/bin"];
  environment.pathsToLink = ["/Applications"];

  environment.systemPackages = with pkgs; [
    # redis
    awsebcli
    sqlite
    clipboard-jh
    codespell
    devenv
    # devpod
    glab
    # graphviz
    just
    lazysql
    # macchina
    maccy
    mycli
    pgcli
    litecli
    nap
    ngrok
    nix-prefetch-scripts
    postman
    # rectangle
    slack
    tldr
    wget
    yaml-language-server
    # nix
    nixd
    nil
    statix

    # lua
    luajitPackages.luacheck

    # rust
    rustup

    #node
    # nodePackages.yarn
    # nodejs_22

    # go
    go
    #comma
    openssl
    gitlab-ci-local
    fnm
    #vscode-extensions.xdebug.php-debug
    #php81Extensions.xdebug

    # rubyPackages.solargraph
    cachix
    ueberzugpp
    podman
    deadnix
    typos-lsp
    typos
    gitleaks
    killport
    age
    # postgis
    #rubyPackages.solargraph
    #rubocop
    #git-crypt
    # bundler
    process-compose
    # neovim
    sops
    gnupg
    # darwin.IOKit
    # kmonad
    #goku
    universal-ctags
    docker
    fzf
    stow
    # gcc
    # bluetui
    # pulsemixer
    ffmpeg
  ];
  # fonts.packages = [] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  fonts.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
    fira-code
  ];
  system.primaryUser = "dev";
  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };
    caskArgs = {
      no_quarantine = true;
      require_sha = false;
    };

    taps = [
      "chase/tap"
      "FelixKratz/formulae"
      "netmute/tap"
      "mongodb/brew"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "dopplerhq/cli/doppler"
      "bottom"
      "copier"
      "kanata"
      "cloudflared"
      "ffmpeg"
      "borders"
      "btop"
      "coreutils"
      "docker"
      "eslint_d"
      "fnm"
      "gemini-cli"
      "gitmoji"
      "gnu-sed"
      "imagemagick"
      "just"
      "lefthook"
      "libiconv"
      "mongocli"
      "mongodb-community@8.0"
      "mpv"
      "nerdfetch"
      "spicetify-cli"
      "spotify_player"
      "task"
      "taskwarrior-tui"
      "whalebrew"
      "wrk"
      "yt-dlp"
      "lazygit"
      {
        name = "redis";
        restart_service = true;
        link = true;
      }
      # {
      #   name = "meilisearch";
      #   restart_service = true;
      #   # link = true;
      # }
      # {
      #   name = "mongodb-community@8.0";
      #   restart_service = true;
      #   link = false;
      #   # conflicts_with = ["mysql"];
      # }
      # {
      #   name = "mysql@8.0";
      #   restart_service = true;
      #   link = true;
      #   conflicts_with = ["mysql"];
      # }
      # {
      #   name = "postgresql@16";
      #   restart_service = true;
      #   link = true;
      #   conflicts_with = ["postgresql"];
      # }
      # "aria2"  # download tool
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "vlc"
      "espanso"
      "amazon-q"
      "arc"
      # "bitwarden"
      "calibre"
      "cloudflare-warp"
      "cursor"
      "doll"
      "evkey"
      "figma"
      "firefox"
      "ghostty"
      "google-chrome"
      "karabiner-elements"
      "keycastr"
      "maccy"
      "mattermost"
      "numi"
      "raindropio"
      "raycast"
      "spotify"
      "todoist-app"
      "zen"

    ];

    masApps = {
      # "Xcode" = 497799835;
      # "DropOver" = 1355679052;
      # "Amphetamine" = 937984704;
      # "Bitwarden" = 1352778147;
    };

    whalebrews = [
      # "whalebrew/wget"
    ];
  };
}
