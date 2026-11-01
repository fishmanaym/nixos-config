{inputs, ...}: {
  flake.nixosModules.broken-kb = {...}: {
    imports = [
      inputs.xremap.nixosModules.default
    ];

    services.xremap = {
      enable = true;

      # withWlroots = true;
      userName = "fish";
      config.keymap = [
        {
          remap = {
            "kpasterisk" = "Shift-102ND";
            "kpslash" = "102ND";
          };
        }
      ];
    };
  };
}
