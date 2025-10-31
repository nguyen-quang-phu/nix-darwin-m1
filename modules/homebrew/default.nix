{
  pkgs,
  lib,
  ...
}: {
  homebrew = {
    enable = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
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
      "padok-team/tap"
      "nikitabobko/tap"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = pkgs.callPackage ./brews.nix {};

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = pkgs.callPackage ./casks.nix {};

    masApps = {
      # "Xcode" = 497799835;
      # "DropOver" = 1355679052;
      # "Amphetamine" = 937984704;
      "Bitwarden" = 1352778147;
    };

    whalebrews = [
      # "whalebrew/wget"
    ];
  };
}
