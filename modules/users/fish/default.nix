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
    files = myLib.getHjemFiles ./dotfiles;
    environment.sessionVariables = {
      EDITOR = "vim";
      VISUAL = "zeditor";
    };
  };
}
