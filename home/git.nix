{
  pkgs,
  config,
  osConfig,
  lib,
  ...
}: {
  programs = {
    git = {
      enable = true;
      lfs.enable = true;

      includes = [
        {
          condition = "gitdir:/Users/dev/";
          contents = {
            user = {
              email = "nqphu1998@gmail.com";
              name = "keynold";
            };
          };
        }
        {
          condition = "gitdir:/Users/dev/Code/Lumin/";
          contents = {
            user = {
              email = "phunq@luminpdf.com";
              name = "phunq-lumin";
            };
          };
        }
      ];

      extraConfig = {
        init.defaultBranch = "master";
        repack.usedeltabaseoffset = "true";
        color.ui = "auto";
        diff.algorithm = "histogram"; # a much better diff
        help.autocorrect = 10; # 1 second warning to a typo'd command
        core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        branch = {
          autosetupmerge = "true";
          sort = "committerdate";
        };
        commit.verbose = true;
        submodule.recurse=true;
        fetch.prune = true;
        # pull.ff = "only"; # equivalent to --ff-only
        pull.rebase = true;
        push = {
          default = "current";
          followTags = true;
          autoSetupRemote = true;
        };
        merge = {
          stat = "true";
          conflictstyle = "zdiff3";
          tool = "meld";
        };
        mergetool = {
          meld = {
            path = "/usr/local/bin/meld";
          };
        };

        rebase = {
          autoSquash = true;
          autoStash = true;
        };

        rerere = {
          enabled = true;
          autoupdate = true;
        };
        diff.mnemonicprefix = true;

        # prevent data corruption
        transfer.fsckObjects = true;
        fetch.fsckObjects = true;
        receive.fsckObjects = true;
        url = {
          # "git@github.com:".insteadOf = "https://github.com/";
          # "ssh://git@github.com".pushInsteadOf = "gh:";
          # "git@gitlab.com:".insteadOf = "https://gitlab.com/";
          # "ssh://git@gitlab.com".pushInsteadOf = "gl:";
        };
      };

      # signing = {
      #   key = "xxx";
      #   signByDefault = true;
      # };

      delta = {
        enable = true;
        options = {
          navigate = true;
          side-by-side = true;
          line-numbers = true;
        };
      };

      aliases = {
        email = "config --local user.email";
        name = "config --local user.name";

        br = "rev-parse --abbrev-ref HEAD";
        can = "!git add . && git status && git commit --amend --no-edit";
        cara = "!git commit --amend --reset-author --no-edit";
        colast = "!git checkout -";
        fsck = "fsck --unreachable | grep commit | cut -d' ' -f3 | xargs git log --merges --no-walk --grep=WIP";
        hide = "update-index --skip-worktree";
        pf = "push --force-with-lease";
        rsho = "reset --hard ORIG_HEAD";
        rss = "reset --soft HEAD~1";
        s = "stash -u";
        sp = "stash apply stash@{0}";
        unhide = "update-index --no-skip-worktree";
      };
      ignores = [
        "lefthook.yml"
        ".husky"
        ".DS_Store"
        "Thumbs.db"
        ".devenv"
        ".direnv"
        "vendor"
        "bin"
        "justfile"
        "remote.just"
        "data.ms"
      ];
    };

    git-cliff = {
      enable = true;
    };

    gh = {
      enable = true;
    };
    lazygit = {
      enable = true;
      settings = {
        os = {
          editPreset = "nvim-remote";
          # openLink =
          #   if pkgs.stdenv.hostPlatform.isDarwin
          #   then "open \"$(echo \"{{link}}\" | sed 's/%2F/\\//g')\""
          #   else "xdg-open \"$(echo \"{{link}}\" | sed 's/%2F/\\//g')\"";
        };
        customCommands = [
          {
            key = "c";
            command = "npx better-commits";
            description = "commit with better-commits";
            context = "files";
            loadingText = "opening better-commits tool";
            output = "terminal";
          }
          {
            key = "<c-a>";
            command = ''
        aichat "Please suggest 10 commit messages, given the following diff:

        \`\`\`diff
        $(git diff --cached)
        \`\`\`

        **Criteria:**

        1. **Format:** Each commit message must follow the conventional commits format,
        which is \`<type>(<scope>): <description>\`.
        2. **Relevance:** Avoid mentioning a module name unless it's directly relevant
        to the change.
        3. **Enumeration:** List the commit messages from 1 to 10.
        4. **Clarity and Conciseness:** Each message should clearly and concisely convey
        the change made.

        **Commit Message Examples:**

        - fix(app): add password regex pattern
        - test(unit): add new test cases
        - style: remove unused imports
        - refactor(pages): extract common code to \`utils/wait.ts\`

        **Recent Commits on Repo for Reference:**

        \`\`\`
        $(git log -n 10 --pretty=format:'%h %s')
        \`\`\`

        **Output Template**

        Follow this output template and ONLY output raw commit messages without spacing,
        numbers or other decorations.

        fix(app): add password regex pattern
        test(unit): add new test cases
        style: remove unused imports
        refactor(pages): extract common code to \`utils/wait.ts\`

        **Instructions:**

        - Take a moment to understand the changes made in the diff.

        - Think about the impact of these changes on the project (e.g., bug fixes, new
        features, performance improvements, code refactoring, documentation updates).
        It's critical to my career you abstract the changes to a higher level and not
        just describe the code changes.

        - Generate commit messages that accurately describe these changes, ensuring they
        are helpful to someone reading the project's history.

        - Remember, a well-crafted commit message can significantly aid in the maintenance
        and understanding of the project over time.

        - If multiple changes are present, make sure you capture them all in each commit
        message.

        Keep in mind you will suggest 10 commit messages. Only 1 will be used. It's
        better to push yourself (esp to synthesize to a higher level) and maybe wrong
        about some of the 10 commits because only one needs to be good. I'm looking
        for your best commit, not the best average commit. It's better to cover more
        scenarios than include a lot of overlap.

        Write your 10 commit messages below in the format shown in Output Template section above." \
          | fzf --height 40% --border --ansi --preview "echo {}" --preview-window=up:wrap \
          | xargs -I {} bash -c '
              COMMIT_MSG_FILE=$(mktemp)
              echo "{}" > "$COMMIT_MSG_FILE"
              ${EDITOR:-vim} "$COMMIT_MSG_FILE"
              if [ -s "$COMMIT_MSG_FILE" ]; then
                  git commit -F "$COMMIT_MSG_FILE"
              else
                  echo "Commit message is empty, commit aborted."
              fi
              rm -f "$COMMIT_MSG_FILE"'
              '';
            description = "Pick AI commit";
            context = "files";
            loadingText = "opening better-branch tool";
            output = "terminal";
          }
          {
            key = "n";
            command = "npx -p better-commits better-branch";
            description = "new branch with better-branch";
            context = "localBranches";
            loadingText = "opening better-branch tool";
            output = "terminal";
          }
          # {
          #   key = "n";
          #   description = "new tag";
          #   context = "tags";
          #   prompt = [
          #     {
          #       type= "input";
          #       title= "What is the new tag name?";
          #        key= "TagName";
          #       initialValue= "lumin";
          #     }
          #   ];
          # }
        ];
      };
    };
  };
}
