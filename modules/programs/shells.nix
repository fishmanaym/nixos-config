{pkgs, ...}:

let
  shellAliases = {
    wifi = "nmcli device wifi";
   # suspend = "systemctl suspend";
    rebuild = "sudo nixos-rebuild switch --flake $XDG_CONFIG_HOME/nixos#$HOSTNAME";
  };
in {
  programs.bash = {
    enable = true;
    inherit shellAliases;
  };

  programs.zsh = {
    enable = false;
    inherit shellAliases;
    syntaxHighlighting.enable = true;
    histFile = "$XDG_CACHE_HOME/zsh/history";
  };
}
