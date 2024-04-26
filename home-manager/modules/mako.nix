{config, nixpkgs, ...}:
{
  services.mako = {
    enable = true;
    layer = "overlay";
    font = "GohuFont";
    width = 300;
    height = 140;
    defaultTimeout = 4000;
    maxVisible = 10;
    margin = "25,25,25,25";
    borderRadius = 0;
    borderSize = 1;
    backgroundColor = "#${config.colorScheme.palette.base00}";
    textColor = "#${config.colorScheme.palette.base05}";
    borderColor = "#${config.colorScheme.palette.base0D}";
  };
}
