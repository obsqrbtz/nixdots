{config, nixpkgs, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1.0;
      window = {
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        size = 14.0;
        #draw_bold_text_with_bright_colors = false;
        normal = {
          family = "GohuFont";
        };
        bold = {
          family = "GohuFont";
          style = "Regular";
        };
      };

      colors = {
        primary = {
          foreground = "#${config.colorScheme.palette.base07}";
          background = "#${config.colorScheme.palette.base00}";
        };
        cursor = {
          text = "#${config.colorScheme.palette.base07}";
          cursor = "#${config.colorScheme.palette.base00}";
        };
        normal = {
          black = "#${config.colorScheme.palette.base00}";
          red = "#${config.colorScheme.palette.base08}";
          green = "#${config.colorScheme.palette.base0B}";
          yellow = "#${config.colorScheme.palette.base0A}";
          blue = "#${config.colorScheme.palette.base0D}";
          magenta = "#${config.colorScheme.palette.base0E}";
          cyan = "#${config.colorScheme.palette.base0C}";
          white = "#${config.colorScheme.palette.base05}";
        };
        bright = {
          black = "#${config.colorScheme.palette.base03}";
          red = "#${config.colorScheme.palette.base09}";
          green = "#${config.colorScheme.palette.base08}";
          yellow = "#${config.colorScheme.palette.base02}";
          blue = "#${config.colorScheme.palette.base04}";
          magenta = "#${config.colorScheme.palette.base06}";
          cyan = "#${config.colorScheme.palette.base0F}";
          white = "#${config.colorScheme.palette.base07}";
        };
      };
    };
  };
}
