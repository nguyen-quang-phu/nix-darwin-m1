_:
[
  "portaudio"
  "spotatui"
  # yazi
  "media-info"
  "ffmpeg"
  "jq"
  "sevenzip"
  "poppler" # don't delete
  "resvg"
  "imagemagick"

  "mole"  # Deep clean and optimize your Mac. 
  "pipx"
  "rustup"
  "resterm"
  "grpcurl"
  "rip"
  "harlequin"
  "dotstate"
  "ast-grep"
  "podman"
  "commitizen"
  "acli"
  "act"
  "bottom"
  "btop"
  "bufbuild/buf/buf"
  "cloudflared"
  "copier"
  "coreutils"
  "deno"
  "docker"
  "dopplerhq/cli/doppler"
  "fnm"
  "gemini-cli"
  "gitmoji"
  "gnu-sed"
  "just"
  "lazygit"
  "lefthook"
  "libiconv"
  "mongocli"
  "mongodb-community@8.0"
  "spotify_player"
  "whalebrew"
  "wrk"
  "yazi"
  "lnav"
  # ruby on rails
  "libyaml"
  "openssl@3"
  "gmp"
  # "rust"
  "libffi"
  "readline"
  "git-town"
  "localstack/tap/localstack-cli"
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
]
