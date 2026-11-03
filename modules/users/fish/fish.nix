{inputs, ...}: {
  flake.nixosModules.fish = {
    pkgs,
    lib,
    ...
  }: let
    getHjemFiles = dir: let
      pathList = lib.filesystem.listFilesRecursive dir;
      pathToRelativeString = path: lib.strings.removePrefix (toString dir + "/") (toString path);
      pathToHjemFile = path: {
        name = pathToRelativeString path;
        value = {source = path;};
      };
    in
      builtins.listToAttrs (map pathToHjemFile pathList);
  in {
    imports = [
      inputs.hjem.nixosModules.default
    ];

    users.users.fish = {
      isNormalUser = true;
      description = "Fishmanaym";
      extraGroups = ["video" "networkmanager" "wheel" "kvm"];
      packages = with pkgs; [];
    };

    hjem.users.fish = {
      directory = "/home/fish";
      files = (getHjemFiles ./dotfiles) // {".icons/default".source = "${pkgs.adwaita-icon-theme}/share/icons/Adwaita";};
      environment.sessionVariables = {
        EDITOR = "vim";
        VISUAL = "zeditor";
      };
    };
  };
}
