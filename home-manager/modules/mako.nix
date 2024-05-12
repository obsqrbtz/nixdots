{config, nixpkgs, ...}:
{
  services.mako = {
    enable = true;
    layer = "overlay";
    font = "Mononoki Nerd Font";
    width = 300;
    height = 140;
    defaultTimeout = 4000;
    maxVisible = 10;
    margin = "25,25,25,25";
    borderRadius = 0;
    borderSize = 1;
    backgroundColor = "#${config.colorScheme.palette.base00}";
    textColor = "#${config.colorScheme.palette.base0F}";
    borderColor = "#${config.colorScheme.palette.base0F}";
  };
}
