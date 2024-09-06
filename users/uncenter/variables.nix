{ config, ... }:
{
  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/.config/flake";

    EDITOR = "hx";
    VISUAL = "code";

    # https://github.com/b3nj5m1n/xdg-ninja
    HISTFILE = "${config.xdg.stateHome}/bash/history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/nodejs/history";
    PNPM_HOME = "${config.xdg.cacheHome}/pnpm";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    GEM_HOME = "${config.xdg.dataHome}/gem";
    GEM_SPEC_CACHE = "${config.xdg.cacheHome}/gem";
    GHCUP_USE_XDG_DIRS = "1";
    YARN_CACHE_FOLDER = "${config.xdg.cacheHome}/yarn";
    YARN_ENABLE_TELEMETRY = "0";
    GNUPGHOME = "${config.xdg.configHome}/gnupg";
    GOPATH = "${config.xdg.dataHome}/go";
    BUNDLE_USER_CONFIG = "${config.xdg.configHome}/bundle";
    BUNDLE_USER_CACHE = "${config.xdg.cacheHome}/bundle";
    BUNDLE_USER_PLUGIN = "${config.xdg.dataHome}/bundle";
    LESSHISTFILE = "${config.xdg.stateHome}/less/history";
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
  };
}
