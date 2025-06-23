{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      "puil" = "pnpm update --interactive --latest";
      "cx" = "chmod +x";

      "gp" = "git push";
      "gl" = "git pull";
      "gc" = "git commit -m";
      "gn" = "git switch -c";
      "gs" = "git switch";
      "ga" = "git add";
    };

    shellAliases = {
      "ls" = "eza";
      "ll" = "ls -la";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "244bb1ebf74bf944a1ba1338fc1026075003c5e3";
          sha256 = "sha256-s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
        };
      }
      {
        name = "done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "d47f4d6551cccb0e46edfb14213ca0097ee22f9a";
          sha256 = "sha256-VSCYsGjNPSFIZSdLrkc7TU7qyPVm8UupOoav5UqXPMk=";
        };
      }
    ];

    shellInit = ''
      luarocks path --bin | source

      # https://fishshell.com/docs/current/cmds/fish_greeting.html
      set fish_greeting
    '';

    # Addresses $PATH re-ordering by Apple's `path_helper` tool, prioritising Apple’s tools over Nix ones.
    # https://github.com/LnL7/nix-darwin/issues/122
    loginShellInit =
      let
        profiles = [
          "/etc/profiles/per-user/$USER"
          "/run/wrappers"
          "/run/current-system/sw"
        ];

        makeBinSearchPath = lib.concatMapStringsSep " " (path: ("\"" + "${path}/bin" + "\""));
      in
      ''
        fish_add_path --move --prepend --path ${makeBinSearchPath profiles}
        set fish_user_paths $fish_user_paths
      '';

    functions = {
      # Recursively create and enter a directory path.
      take = ''
        set dir $argv[1]
        if test -z "$dir"
            return 1
        end

        mkdir -p "$dir"
        cd "$dir"
      '';

      mk = ''
        set dir (dirname $argv[1])
        set file (basename $argv[1])
        mkdir -p $dir
        touch $dir/$file
      '';

      # Check if a command is present in PATH.
      have = ''
        command -v $argv > /dev/null
      '';

      # Convert all PNG files in the CWD to WebP.
      png_to_webp = ''
        for file in *.png
          set output (basename $file .png).webp
          cwebp -lossless $file -o $output
        end
      '';

      # Like https://github.com/nix-community/comma, but who needs a whole CLI tool for it.
      "," = ''
        nix run "nixpkgs#$argv[1]" -- $argv[2..-1]
      '';
    };
  };

  xdg.configFile =
    let
      symlink =
        fileName:
        {
          recursive ? false,
        }:
        {
          source = config.lib.file.mkOutOfStoreSymlink "${fileName}";
          inherit recursive;
        };
    in
    {
      "fish/completions" = symlink "${./fish/completions}" { recursive = true; };
    };
}
