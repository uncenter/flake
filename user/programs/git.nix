{
  lib,
  pkgs,
  inputs',
  osConfig,
  ...
}:
let
  committerName = "uncenter";
  committerEmail = "uncenter@uncenter.dev";
  signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJqPy3W/cnefiuTlqtY6gQsIimz25sYZ6GglXOASK8A4";
  signingProgram =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
    else
      "/mnt/c/Users/uncen/AppData/Local/1Password/app/8/op-ssh-sign-wsl";
in
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

          userName = committerName;
          userEmail = committerEmail;

          lfs = {
            enable = true;
            skipSmudge = true;
          };

          signing = {
            format = "ssh";
            key = signingKey;
            signer = signingProgram;
            signByDefault = true;
          };

          includes = [
            {
              path = "work.config";
              condition = "gitdir:~/Dev/Work/";
            }
          ];

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

            stash.showPatch = true;
            stash.showIncludeUntracked = true;

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
          settings = {
            git = {
              overrideGpg = true;
            };
          };
        };

        programs.jujutsu = {
          enable = true;
          settings = {
            user = {
              name = committerName;
              email = committerEmail;
            };
            signing = {
              behavior = "own";
              backend = "ssh";
              key = signingKey;
              backends.ssh.program = signingProgram;
            };
          };
        };

        home.packages = with pkgs; [
          gfold
          gitoxide
          lazyjj
          (inputs'.patchy.packages.default.overrideAttrs (oa: {
            doCheck = false;
          }))
        ];
      })
    ]
  );
}
