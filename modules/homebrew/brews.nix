_:
[
  "gemini-cli"
  "glances"
  "poppler"
  "deno"
  "bottom"
  "btop"
  "bufbuild/buf/buf"
  "cloudflared"
  "copier"
  "coreutils"
  "docker"
  "dopplerhq/cli/doppler"
  "ffmpeg"
  "fnm"
  "gnu-sed"
  "imagemagick"
  "just"
  "lazygit"
  "lefthook"
  "libiconv"
  "mongocli"
  "mongodb-community@8.0"
  "mpv"
  "spotify_player"
  "whalebrew"
  "wrk"
  "yt-dlp"
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
