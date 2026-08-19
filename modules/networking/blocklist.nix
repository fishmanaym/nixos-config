{ hostname, ... }: # /etc/hosts

{
  networking.stevenblack = {
    enable = true;
    block = [ 
      # "fakenews"
      # "gambling"
      # "porn"
      # "social"
    ];
    whitelist = [ 
      # example.com
    ];
  };
}