{pkgs, ...}:

let
  shellAliases = {
    wifi = "nmcli device wifi";
    # suspend = "systemctl suspend";
    rebuild = "sudo nixos-rebuild switch --flake $XDG_CONFIG_HOME/nixos#$HOSTNAME";
  };

  # login to mango on tty1
  loginShellInit = ''
    if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec mango
    fi
  '';
in {
  programs.bash = {
    enable = true;
    inherit shellAliases loginShellInit;
    histFile = "$XDG_CACHE_HOME/bash/history";
  };

  programs.zsh = {
    enable = false;
    inherit shellAliases loginShellInit;
    syntaxHighlighting.enable = true;
    histFile = "$XDG_CACHE_HOME/zsh/history";
  };
}
