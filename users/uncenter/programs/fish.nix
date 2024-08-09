{ pkgs, config, ... }:
{
  programs.fish = {
    enable = true;
    catppuccin.enable = true;

    shellAbbrs = {
      "puil" = "pnpm update --interactive --latest";

      "gp" = "git push";
      "gpm" = "git push origin main";
      "gl" = "git pull";
      "glm" = "git pull origin main";
      "gc" = "git commit -m";
      "gn" = "git checkout -b";
      "gs" = "git checkout";
      "ga" = "git add";

      "gg" = "lazygit";
    };

    shellAliases = {
      "ls" = "eza";
      "ll" = "ls -la";

      "cat" = "bat";
      "dig" = "doggo";

      # Yes, I really am this lazy.
      "cx" = "chmod +x";

      # Open the Rust Documentation locally (standard library reference, the book, Rust By Example, etc).
      "rustdocs" = "open \"$(rustc --print sysroot)/share/doc/rust/html/index.html\"";

      # Create a new branch for a pull request with a random name.
      # 'There are only two hard things in Computer Science: cache invalidation and **naming things**.'
      # - (supposedly) Phil Karlton
      "gpr" = "git checkout -b \"pr-$(openssl rand -hex 4)\"";
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
      ${if pkgs.stdenv.isDarwin then "/opt/homebrew/bin/brew shellenv | source" else ""}
      source ${./fish/config.fish}
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
