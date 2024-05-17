{
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    catppuccin.enable = true;

    shellAbbrs = {
      "puil" = "pnpm update --interactive --latest";

      "gp" = "git push origin";
      "gpm" = "git push origin main";
      "gl" = "git pull origin";
      "glm" = "git pull origin main";
      "gc" = "git commit -m";
      "glog" = "git log";
      "gnew" = "git checkout -b";
      "gs" = "git checkout";
      "ga" = "git add";
    };

    shellAliases = {
      "vi" = "nvim";
      "vim" = "nvim";

      "ls" = "eza";
      "ll" = "ls -la";

      "cat" = "bat";
      "dig" = "doggo";

      "cx" = "chmod +x";

      "rustlocal" = "open \"$(rustc --print sysroot)/share/doc/rust/html/index.html\"";
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
      source ${./fish/config.fish}
    '';

    functions = {
      take = ''
        set dir $argv[1]
        if test -z "$dir"
            return 1
        end

        mkdir -p "$dir"
        cd "$dir"
      '';

      have = ''
        command -v $argv > /dev/null
      '';

      pngtowebp = ''
        for file in *.png
          set output (basename $file .png).webp
          cwebp -lossless $file -o $output
        end
      '';

      "," = ''
        nix run "nixpkgs#$argv[1]" -- $argv[2..-1]
      '';
    };
  };

  xdg.configFile = let
    symlink = fileName: {recursive ? false}: {
      source = config.lib.file.mkOutOfStoreSymlink "${fileName}";
      inherit recursive;
    };
  in {
    "fish/completions" = symlink "${./fish/completions}" {
      recursive = true;
    };
  };
}
