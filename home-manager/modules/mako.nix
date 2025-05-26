{config, nixpkgs, ...}:
{
  services.mako.settings = {
    enable = true;
    layer = "overlay";
    font = "SauceCodePro Nerd Font Mono";
    width = 300;
    height = 140;
    default-timeout = 4000;
    max-visible = 10;
    margin = "25,25,25,25";
    border-radius = 0;
    border-size = 1;
    background-color = "#${config.colorScheme.palette.base00}";
    text-color = "#${config.colorScheme.palette.base0F}";
    border-color = "#${config.colorScheme.palette.base0F}";
  };
}
