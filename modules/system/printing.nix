{...}: {
  flake.nixosModules.printing = {...}: {
    # Enable CUPS to print documents.
    services.printing.enable = true;

    # hardware.printers.ensurePrinters = [
    #   {
    #     name = "BrotherHL_Home";
    #     location = "Home";
    #     description = "Brother HL-1210W"
    #     deviceUri = "..."; # need to add
    #     model = "";
    #     ppdOptions = {
    #       PageSize = "A4"
    #     };
    #   };
    # ];
  };
}
