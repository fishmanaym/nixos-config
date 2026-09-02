{ pkgs, ... }:

{
  # users.mutableUsers = false;

  users.users = {
    fish = {
      isNormalUser = true;
      description = "Fishmanaym";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };

  hjem.users = {
    fish = {
      directory = /home/fish;
      files = {
        ".config/waybar".source = ./.config/waybar;
        ".config/mango".source = ./.config/mango;
      };
      environment.sessionVariables = {
        EDITOR = "vim";
        VISUAL = "vim";
      };
    };
  };
}