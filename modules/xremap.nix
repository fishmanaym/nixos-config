{
  services.xremap = {
    enable = true;

    # withWlroots = true;
    userName = "fish";
    config = {
      keymap = [
        {
          remap = {
            "kpminus" = "Shift-102ND";
            "kpasterisk" = "102ND";
          };
        }
      ];
    };
  };
}
