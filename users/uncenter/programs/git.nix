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
          userEmail = "47499684+uncenter@users.noreply.github.com";

          lfs = {
            enable = true;
            skipSmudge = true;
          };

          extraConfig = {
            core.editor = "hx";

            user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJqPy3W/cnefiuTlqtY6gQsIimz25sYZ6GglXOASK8A4";
            commit.gpgsign = true;
            gpg.format = "ssh";
            "gpg \"ssh\"".program =
              if pkgs.stdenv.hostPlatform.isDarwin then
                "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
              else
                "/mnt/c/Users/uncen/AppData/Local/1Password/app/8/op-ssh-sign-wsl";

            log.date = "iso";
            merge.conflictstyle = "zdiff3";
            diff.algorithm = "histogram";

            init.defaultBranch = "main";
            push.autoSetupRemote = true;
            pull.rebase = true;

            help.autocorrect = "prompt";
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
