{config, nixpkgs, ...}:
{
  services.mako = {
    enable = true;
    layer = "overlay";
    font = "JetBrainsMono 13";
    width = 300;
    height = 80;
    defaultTimeout = 4000;
    maxVisible = 10;
    margin = "25,25,25,25";
    borderRadius = 10;
    borderSize = 3;
    backgroundColor = "#${config.colorScheme.palette.base00}";
    textColor = "#${config.colorScheme.palette.base0F}";
    borderColor = "#${config.colorScheme.palette.base01}";
  };
}
