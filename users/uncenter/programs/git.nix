{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    difftastic.enable = true;

    ignores = [ ".DS_Store" ];

    aliases = {
      "undo" = "reset --soft HEAD~1";
    };

    userName = "uncenter";
    userEmail = "47499684+uncenter@users.noreply.github.com";

    lfs = {
      enable = true;
      skipSmudge = true;
    };

    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJqPy3W/cnefiuTlqtY6gQsIimz25sYZ6GglXOASK8A4";
      init.defaultBranch = "main";

      commit.gpgsign = true;
      gpg.format = "ssh";
      "gpg \"ssh\"".program =
        if pkgs.stdenv.isDarwin then
          "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
        else
          "/mnt/c/Users/uncen/AppData/Local/1Password/app/8/op-ssh-sign-wsl";

      log.date = "iso";
      merge.conflictstyle = "zdiff3";
      diff.algorithm = "histogram";

      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
