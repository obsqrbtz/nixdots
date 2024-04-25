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
        size = 12.0;
        # draw_bold_text_with_bright_colors = true;
        normal = {
          family = "JetBrains Mono";
          style = "Bold";
        };
      };

      colors = {
        primary = {
          foreground = "#${config.colorScheme.palette.base0F}";
          background = "#${config.colorScheme.palette.base00}";
        };
        cursor = {
          text = "#${config.colorScheme.palette.base00}";
          cursor = "#${config.colorScheme.palette.base0F}";
        };
        normal = {
          black = "#${config.colorScheme.palette.base00}";
          red = "#${config.colorScheme.palette.base01}";
          green = "#${config.colorScheme.palette.base02}";
          yellow = "#${config.colorScheme.palette.base03}";
          blue = "#${config.colorScheme.palette.base04}";
          magenta = "#${config.colorScheme.palette.base05}";
          cyan = "#${config.colorScheme.palette.base06}";
          white = "#${config.colorScheme.palette.base07}";
        };
        bright = {
          black = "#${config.colorScheme.palette.base08}";
          red = "#${config.colorScheme.palette.base09}";
          green = "#${config.colorScheme.palette.base0A}";
          yellow = "#${config.colorScheme.palette.base0B}";
          blue = "#${config.colorScheme.palette.base0C}";
          magenta = "#${config.colorScheme.palette.base0D}";
          cyan = "#${config.colorScheme.palette.base0E}";
          white = "#${config.colorScheme.palette.base0F}";
        };
      };
    };
  };
}
