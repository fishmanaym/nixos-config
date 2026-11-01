{...}: {
  flake.nixosModules.locale = {...}: {
    # Set your time zone.
    time.timeZone = "Europe/Madrid";

    # Select internationalisation properties.
    i18n = let
      us = "en_US.UTF-8";
      es = "es_ES.UTF-8";
    in {
      defaultLocale = us;
      extraLocales = ["${es}/UTF-8"]; # requires es_ES.UTF-8/UTF-8 format

      extraLocaleSettings = {
        LC_ADDRESS = es;
        LC_IDENTIFICATION = es;
        LC_MEASUREMENT = es;
        LC_MONETARY = es;
        LC_NAME = es;
        LC_NUMERIC = us;
        LC_PAPER = es;
        LC_TELEPHONE = es;
        LC_TIME = es;
      };
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "es";
      variant = ""; # nodeadkeys???
    };

    # Configure console keymap
    console.keyMap = "es";
  };
}
