{lib, ...}: {
  programs.fish = {
    enable = true;

    shellAbbrs = {
      "puil" = "pnpm update --interactive --latest";
    };

    shellAliases = {
      "vi" = "nvim";
      "vim" = "nvim";

      "ls" = "eza";
      "ll" = "ls -la";

      "cat" = "bat";;
      "dig" = "doggo";

      "cx" = "chmod +x";
    }


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
        }
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

      __newlinefix = {
        body = ''
          if test -z "$NEW_LINE_BEFORE_PROMPT"
            set -gx NEW_LINE_BEFORE_PROMPT 1
          else if test "$NEW_LINE_BEFORE_PROMPT" -eq 1
            echo
          end
        '';
        onEvent = "fish_prompt";
      };
      clear = ''
        set -gx NEW_LINE_BEFORE_PROMPT
        command clear
      '';
    };

    xdg.configFile = let
      symlink = fileName: {recursive ? false}: {
        source = config.lib.file.mkOutOfStoreSymlink ${fileName}";
        inherit recursive;
      };
    in {
      "fish/completions" = symlink ${./fish/completions} {
        recursive = true;
      };
    };
  };
}
