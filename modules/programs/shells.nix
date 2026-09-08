{
  config,
  lib,
  ...
}: let
  shellAliases = {
    wifi = "nmcli device wifi";
    # suspend = "systemctl suspend";
    rebuild = "sudo nixos-rebuild switch --flake $XDG_CONFIG_HOME/nixos#$HOSTNAME";
  };

  # login to mango on tty1
  loginShellInit = ''
    if uwsm check may-start; then
        exec uwsm start default
    fi
  '';

  cfg = config.programs;
in {
  programs.bash = {
    enable = true;
    inherit shellAliases loginShellInit;
  };

  # move bash history to .cache to keep home clean
  environment.sessionVariables.HISTFILE = lib.mkIf cfg.bash.enable "$XDG_CACHE_HOME/bash/history";
  system.userActivationScripts.bashHistoryFoldersCreate = lib.mkIf cfg.bash.enable "mkdir -p $XDG_CACHE_HOME/bash";

  programs.zsh = {
    enable = false;
    inherit shellAliases loginShellInit;
    syntaxHighlighting.enable = true;
    histFile = "$XDG_CACHE_HOME/zsh/history";
  };
  environment.shells = lib.mkIf cfg.zsh.enable [cfg.zsh.package];
}
