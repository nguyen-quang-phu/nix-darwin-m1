{
pkgs,
config,
osConfig,
lib,
...
}: {
  programs = {
    aerospace = {
      enable = true;
      userSettings = {

        start-at-login = true;
        mode.main.binding = {
          alt-h = "focus left";
          alt-j = "focus down";
          alt-k = "focus up";
          alt-l = "focus right";

          alt-shift-h = "move left";
          alt-shift-j = "move down";
          alt-shift-k = "move up";
          alt-shift-l = "move right";

          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          alt-4 = "workspace 4";
          alt-5 = "workspace 5";
          alt-6 = "workspace 6";
          alt-7 = "workspace 7";
          alt-8 = "workspace 8";
          alt-9 = "workspace 9";
          alt-a = "workspace A";
          alt-b = "workspace B";
          alt-c = "workspace C";
          alt-d = "workspace D";
          alt-e = "workspace E";
          alt-f = "workspace F";
          alt-g = "workspace G";
          alt-m = "workspace M";
          alt-n = "workspace N";
          alt-p = "workspace P";
          alt-q = "workspace Q";
          alt-r = "workspace R";
          alt-s = "workspace S";
          alt-t = "workspace T";
          alt-u = "workspace U";
          alt-v = "workspace V";
          alt-w = "workspace W";
          alt-x = "workspace X";
          alt-y = "workspace Y";
          alt-z = "workspace Z";

          alt-shift-1 = "move-node-to-workspace 1";
          alt-shift-2 = "move-node-to-workspace 2";
          alt-shift-3 = "move-node-to-workspace 3";
          alt-shift-4 = "move-node-to-workspace 4";
          alt-shift-5 = "move-node-to-workspace 5";
          alt-shift-6 = "move-node-to-workspace 6";
          alt-shift-7 = "move-node-to-workspace 7";
          alt-shift-8 = "move-node-to-workspace 8";
          alt-shift-9 = "move-node-to-workspace 9";
          alt-shift-a = "move-node-to-workspace A";
          alt-shift-b = "move-node-to-workspace B";
          alt-shift-c = "move-node-to-workspace C";
          alt-shift-d = "move-node-to-workspace D";
          alt-shift-e = "move-node-to-workspace E";
          alt-shift-f = "move-node-to-workspace F";
          alt-shift-g = "move-node-to-workspace G";
          alt-shift-i = "move-node-to-workspace I";
          alt-shift-m = "move-node-to-workspace M";
          alt-shift-n = "move-node-to-workspace N";
          alt-shift-o = "move-node-to-workspace O";
          alt-shift-p = "move-node-to-workspace P";
          alt-shift-q = "move-node-to-workspace Q";
          alt-shift-r = "move-node-to-workspace R";
          alt-shift-s = "move-node-to-workspace S";
          alt-shift-t = "move-node-to-workspace T";
          alt-shift-u = "move-node-to-workspace U";
          alt-shift-v = "move-node-to-workspace V";
          alt-shift-w = "move-node-to-workspace W";
          alt-shift-x = "move-node-to-workspace X";
          alt-shift-y = "move-node-to-workspace Y";
          alt-shift-z = "move-node-to-workspace Z";
          alt-tab = "workspace-back-and-forth";
          alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

          # cmd-h = []; # Disable "hide application"
          cmd-alt-h = []; # Disable "hide others"
        };

        after-startup-command = [
          # Launch Kitty and assign to workspace 1
          "exec-and-forget /etc/profiles/per-user/dev/bin/kitty"
        ];
        on-window-detected=[
          {
            # check-further-callbacks = false;
            "if" = {
              app-id = "net.kovidgoyal.kitty";
              # app-name-regex-substring = "CoolApp";
              # during-aerospace-startup = false;
              # window-title-regex-substring = "Title";
              # workspace = "cool-workspace";
            };
            run = [
              "move-node-to-workspace 1"
            ];
          }
          {
            "if" = {
              app-id = "org.mozilla.firefox";
            };
            run = [
              "move-node-to-workspace 2"
            ];
          }
          {
            "if" = {
              app-id = "Mattermost.Desktop";
            };
            run = [
              "move-node-to-workspace 3"
            ];
          }
          {
            # check-further-callbacks = false;
            "if" = {
              app-id = "com.google.Chrome";
            };
            run = [
              "move-node-to-workspace C"
            ];
          }
          {
            "if" = {
              app-id = "com.electron.dockerdesktop";
            };
            run = [
              "move-node-to-workspace D"
            ];
          }
          {
            "if" = {
              app-id = "com.spotify.client";
            };
            run = [
              "move-node-to-workspace S"
            ];
          }
          {
            "if" = {
              app-id = "com.openai.chat";
            };
            run = [
              "move-node-to-workspace G"
            ];
          }
          {
            "if" = {
              app-id = "app.yaak.desktop";
            };
            run = [
              "move-node-to-workspace Y"
            ];
          }
          {
            # check-further-callbacks = false;
            "if" = {
              app-id = "app.zen-browser.zen";
            };
            run = [
              "move-node-to-workspace 9"
            ];
          }
          {
            "if" = {
              app-id = "com.atlassian.trello";
            };
            run = [
              "move-node-to-workspace T"
            ];
          }

          {
            "if" = {
              app-id = "com.bitwarden.desktop";
            };
            run = [
              "move-node-to-workspace B"
            ];
          }
        ];
      };
    };
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
      settings = {};
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
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      keymap={
        manager.prepend_keymap = [
          {
            run = ''
              shell 'just generate-component $PWD'
            '';
            on = [ ";" ];
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
