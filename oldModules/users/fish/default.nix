{
  pkgs,
  myLib,
  ...
}: {
  # users.mutableUsers = false;

  users.users.fish = {
    isNormalUser = true;
    description = "Fishmanaym";
    extraGroups = ["networkmanager" "wheel" "kvm"];
    packages = with pkgs; [];
  };

  hjem.users.fish = {
    directory = "/home/fish";
    files = (myLib.getHjemFiles ./dotfiles) // {".icons/default".source = "${pkgs.adwaita-icon-theme}/share/icons/Adwaita";};
    environment.sessionVariables = {
      EDITOR = "vim";
      VISUAL = "zeditor";
    };
  };
}
