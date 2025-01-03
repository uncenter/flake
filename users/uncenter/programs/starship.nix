{ lib, osConfig, ... }:
{
  programs.starship = lib.mkIf osConfig.glade.cli.enable {
    enable = true;

    enableFishIntegration = true;
    enableBashIntegration = true;

    settings = {
      add_newline = false;
      continuation_prompt = "[](yellow) ";
      format = builtins.concatStringsSep "" [
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$package"
        "$nodejs"
        "$python"
        "$rust"
        "$sudo"
        "$fill"
        "$shell"
        "$line_break"
        "$status"
        "$os"
        "$character"
      ];
      command_timeout = 1000;

      fill.symbol = " ";

      character = {
        success_symbol = "[\\$](green)";
        error_symbol = "[\\$](red)";
      };

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
        version_format = "v\${raw}";
        display_private = true;
      };

      nodejs = {
        symbol = "";
        style = "green";
        not_capable_style = "red";
        format = "[via $symbol $version]($style) ";
        version_format = "v\${raw}";
      };

      python = {
        symbol = "󱔎";
        style = "yellow";
        format = "[via $symbol $version]($style) ";
        version_format = "v\${raw}";
      };

      rust = {
        symbol = "";
        style = "red";
        format = "[via $symbol $version]($style) ";
        version_format = "v\${raw}";
      };
    };
  };
}
