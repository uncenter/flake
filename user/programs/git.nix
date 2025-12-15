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
  signingKey = builtins.readFile ../../keys/ssh.pub;
  signingProgram =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
    else
      "/mnt/c/Program Files/1Password/app/8/op-ssh-sign-wsl";
in
{
  config = lib.mkIf osConfig.glade.tooling.git.enable (
    lib.mkMerge [
      {
        programs.git = {
          enable = true;

          ignores = [ ".DS_Store" ];

          settings = {
            alias = {
              undo = "reset --soft HEAD~1";
              reword = "commit --amend -C HEAD --edit";
              root = "rev-parse --show-toplevel";
            };

            user.name = committerName;
            user.email = committerEmail;

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
              path = "private.config";
              condition = "gitdir:~/Dev/Work/";
            }
            {
              path = "private.config";
              condition = "gitdir:~/Dev/School/";
            }
          ];
        };
      }

      (lib.mkIf osConfig.glade.programs.enable {
        programs.difftastic.git.enable = true;

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
