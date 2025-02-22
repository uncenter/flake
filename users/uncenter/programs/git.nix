{
  lib,
  pkgs,
  inputs',
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.glade.tooling.git.enable (
    lib.mkMerge [
      {
        programs.git = {
          enable = true;
          difftastic.enable = true;

          ignores = [ ".DS_Store" ];

          aliases = {
            "undo" = "reset --soft HEAD~1";
            "reword" = "commit --amend -C HEAD --edit";
          };

          userName = "uncenter";
          userEmail = "uncenter@uncenter.dev";

          lfs = {
            enable = true;
            skipSmudge = true;
          };

          signing = {
            format = "ssh";
            key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJqPy3W/cnefiuTlqtY6gQsIimz25sYZ6GglXOASK8A4";
            signer =
              if pkgs.stdenv.hostPlatform.isDarwin then
                "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
              else
                "/mnt/c/Users/uncen/AppData/Local/1Password/app/8/op-ssh-sign-wsl";
            signByDefault = true;
          };

          extraConfig = {
            core.editor = "hx";
            init.defaultBranch = "main";

            diff.algorithm = "histogram";
            diff.colorMoved = "plain"; # show code movement in different colors than added and removed lines.
            diff.mnemonicPrefix = true; # replace a/ and b/ in diff header output with where the diff is coming from; i/ (index), w/ (working directory) or c/ commit.

            push.autoSetupRemote = true;

            fetch.prune = true;
            fetch.pruneTags = true;
            fetch.all = true;

            pull.rebase = true;
            rebase.autostash = true;

            rerere.enabled = true; # record before and after states of rebase conflicts.
            rerere.autoupdate = true; # automatically re-apply discovered resolutions.

            log.date = "iso";
            branch.sort = "-committerdate";
            tag.sort = "version:refname";
            help.autocorrect = "prompt";
            commit.verbose = true; # display diff output in commit editor for reference.
          };
        };
      }

      (lib.mkIf osConfig.glade.programs.enable {
        programs.gh = {
          enable = true;
          gitCredentialHelper.enable = true;
        };
        programs.lazygit = {
          enable = true;
          package = pkgs.lazygit.overrideAttrs (_: {
            src = pkgs.fetchFromGitHub {
              owner = "jesseduffield";
              repo = "lazygit";
              rev = "ef718f3386df3db4c062103266c007a3fca46c61";
              hash = "sha256-Z5BmVLdtXyCdSILypfq+W3Ezn9Qn+aSG9KxgQggN6xE=";
            };
          });
        };

        home.packages = with pkgs; [
          gfold
          gitoxide
          jujutsu
          (lazyjj.overrideAttrs (_: {
            doCheck = false;
          }))
          inputs'.patchy.packages.default
        ];
      })
    ]
  );
}
