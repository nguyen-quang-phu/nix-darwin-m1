{
pkgs,
config,
osConfig,
lib,
...
}: {

  programs = {
    kitty = {
      enable = true;
      extraConfig = "";
      font.name = "JetBrainsMono Nerd Font";
      font.size = 14;
      shellIntegration.enableZshIntegration = true;
      shellIntegration.mode = "no-title no-cursor";
      themeFile = "Catppuccin-Mocha";

      keybindings = {
        # kitty +kitten show_key
        "cmd+1" = "send_text all \\x1b1";
        "cmd+2" = "send_text all \\x1b2";
        "cmd+3" = "send_text all \\x1b3";
        "cmd+4" = "send_text all \\x1b4";
        "cmd+5" = "send_text all \\x1b5";
        "cmd+6" = "send_text all \\x1b6";
        "cmd+7" = "send_text all \\x1b7";
        "cmd+8" = "send_text all \\x1b8";
        "cmd+9" = "send_text all \\x1b9";
        "cmd+enter" = "send_text all \\x02z";
        "cmd+h" = "send_text all \\x1bh";
        "cmd+j" = "send_text all \\x1bj";
        "cmd+k" = "send_text all \\x1bk";
        "cmd+l" = "send_text all \\x1bl";
        "cmd+f" = "send_text all \\x1bf";
        "cmd+t" = "send_text all \\x02c";
        "cmd+shift+t" = "send_text all \\x02pw";
        "cmd+shift+ctrl+alt+a" = "send_text all \\x01";
        "cmd+shift+ctrl+alt+x" = "send_text all \\x18";
      };

      settings = {
        copy_on_select = true;
        cursor_blink_interval = 0;
        cursor_shape = "beam";
        cursor_stop_blinking_after = 0;
        disable_ligatures = "cursor";
        hide_window_decorations = true;
        macos_option_as_alt = true;
        scrollback_lines = -1;
        strip_trailing_spaces = "always";
        startup_session = "./startup.conf";
        allow_remote_control = "socket-only";
        listen_on = "unix:/tmp/kitty";
      };
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = false;
      oh-my-zsh.enable = true;
      syntaxHighlighting.enable = true;
      initContent = ''
        eval $(cat ${config.age.secrets.mcp.path})
        export PATH="$HOME/.local/bin:$PATH"
        export PATH="$HOME/.cargo/bin:$PATH"
        export XDG_CONFIG_HOME="$HOME/.config"
        eval "$(fnm env --use-on-cd --shell zsh)"
        #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
        export SDKMAN_DIR="/Users/dev/.sdkman"
        export ESPANSO_CONFIG_DIR="$HOME/.config/espanso"
        [[ -s "/Users/dev/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dev/.sdkman/bin/sdkman-init.sh"
      '';
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    zellij = {
      enable = true;
      enableZshIntegration = false;
    };
    atuin = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;

      flags = [];
      settings = {
        keymap_mode = "vim-normal";
        # theme = "Catppuccin-Mocha-Mauve";
      };
      # themes = {
      #   "Catppuccin-Mocha-Mauve" = {
      #     src = pkgs.fetchFromGitHub {
      #       owner = "catppuccin";
      #       repo = "atuin";
      #       rev = "main";
      #       sha256 = "sha256-j9L+jPZ52Gg2r/2l53/tS20sS2SgJ8c/8a4S4J4j4j4=";
      #     };
      #     file = "themes/mocha/catppuccin-mocha-mauve.toml";
      #   };
      # };
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Catppuccin Mocha";
      };
      themes = {
        "Catppuccin Mocha" = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "d714cc1d358ea51bfc02550dabab693f70cccea0";
            sha256 = "1zlryg39y4dbrycjlp009vd7hx2yvn5zfb03a2vq426z78s7i423";
          };
          file = "themes/Catppuccin Mocha.tmTheme";
        };
      };
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      git = true;
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };

    fd = {
      enable = true;
      ignores = [
        "*.bak"
        ".git/"
        "node_modules/"
        "vendor/"
      ];
    };

    jq = {
      enable = true;
    };

    lazydocker = {
      enable = true;
    };

    mise = {
      enable = false;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    ripgrep = {
      enable = true;
      arguments = [
        "--no-require-git"
      ];
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        format = "$shell$username$hostname$localip$shlvl$singularity$kubernetes$directory$vcsh$fossil_branch$fossil_metrics$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$pijul_channel$docker_context$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$gleam$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$gradle$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$quarto$raku$rlang$red$ruby$rust$scala$solidity$swift$terraform$typst$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$memory_usage$aws$gcloud$openstack$azure$nats$direnv$env_var$crystal$custom$sudo$cmd_duration$line_break$jobs$battery$time$status$os$container$character";
        add_newline = false;
        shell = {
          disabled = false;
          format = "[$indicator]($style): ";
        };
        username = {
          show_always = true;
          format = "💻 [$user]($style)@";
        };
        hostname = {
          disabled = false;
          format = "[$ssh_symbol$hostname]($style) ";
          ssh_only = false;
        };
        directory = {
          format = "📁 [$path]($style)[$read_only]($read_only_style) ";
        };
        git_branch = {
          always_show_remote = true;
          format = "[$symbol$branch(:$remote_branch)]($style)";
        };
      };
    };

    yazi = {
      enable = false;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      settings = {
        manager = {
          show_hidden = true;
        };
      };
      keymap = {
        manager.prepend_keymap = [
          {
            run = ''
              shell 'just generate-component $PWD'
            '';
            on = [";"];
          }
        ];
      };
    };

    uv = {
      enable = true;
    };
    bun = {
      enable = false;
    };
    helix = {
      enable = false;
    };
    zathura = {
      enable = true;
    };
    zed-editor = {
      enable = false;
    };
    emacs = {
      enable = true;
      package = pkgs.emacs-macport;
    };
  };
}
