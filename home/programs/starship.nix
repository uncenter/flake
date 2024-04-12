_: {
  programs.starship = {
    enable = true;
    catppuccin.enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    settings = {
      add_newline = false;
      continuation_prompt = "[](yellow) ";
      right_format = "$cmd_duration";
      format = ''
        $username\
        $hostname\
        $directory\
        $git_branch\
        $git_commit\
        $git_state\
        $git_metrics\
        $git_status\
        $docker_context\
        $package\
        $c\
        $cmake\
        $deno\
        $elixir\
        $golang\
        $haskell\
        $nodejs\
        $php\
        $python\
        $rust\
        $sudo\
        $fill\
        $shell\
        $line_break\
        $status\
        $os\
        $character'';
      
      fill.symbol = " ";

      character = {
        success_symbol = "[](green)";
        error_symbol = "[](red)";
        vimcmd_symbol = "[](green)";
      };
      cmd_duration = {
        min_time = 0;
        show_milliseconds = true;
        style = "subtext0";
        format = "[$duration]($style)";
      };

      username = {
        show_always = true;
        format = "[$user]($style)@";
      };

      hostname.ssh_only = false;

      directory = {
        truncation_length = 5;
        truncate_to_repo = false;
        style = "blue";
        read_only = " ";
        read_only_style = "red";
      };

      git_branch = {
        symbol = "";
        style = "mauve";
        format = "[on $symbol $branch]($style) ";
      };

      git_status = {
        conflicted = "";
        ahead = ">";
        behind = "<";
        diverged = "#";
        untracked = "?";
        stashed = "≡";
        modified = "!";
        staged = "+";
        renamed = "%";
        deleted = "X";
      };

      package = {
        symbol = "";
        style = "peach";
        format = "[is $symbol $version]($style) ";
        version_format = "v${raw}";
        display_private = true;
      };

      nodejs = {
        symbol = "";
        style = "green";
        not_capable_style = "red";
        format = "[via $symbol $version]($style) ";
        version_format = "v${raw}";
      };

      golang = {
        symbol = "󰟓";
        style = "sky";
        not_capable_style = "red";
        format = "[via $symbol $version]($style) ";
        version_format = "v${raw}";
      };

      python = {
        symbol = "󱔎";
        style = "yellow";
        format = "[via $symbol $version]($style) ";
        version_format = "v${raw}";
      }
    };
  };
}
