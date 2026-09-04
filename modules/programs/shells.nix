{pkgs, ...}:

let
  shellAliases = {
    wifi = "nmcli device wifi";
    suspend = "systemctl suspend";
  };
in {
  programs.bash = {
    enable = true;
    inherit shellAliases;
  };

  programs.zsh = {
    enable = true;
    inherit shellAliases;
    syntaxHighlighting.enable = true;
    histFile = "$XDG_CACHE_HOME/zsh/history";
  };
}