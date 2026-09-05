{ config, pkgs, lib, ... }:

{
  # users.mutableUsers = false;

  users.users.fish = {
    isNormalUser = true;
    description = "Fishmanaym";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  hjem.users.fish = {
    directory = "/home/fish";
    files = {
      ".config/git".source = ./dotfiles/.config/git;
      ".config/waybar".source = ./dotfiles/.config/waybar;
      ".config/mango".source = ./dotfiles/.config/mango;
    };
    environment.sessionVariables = {
      EDITOR = "vim";
      VISUAL = "zed";
    };
  };
}
