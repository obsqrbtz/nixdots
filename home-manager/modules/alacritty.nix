{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      window = {
        padding = {
          x = 10;
          y = 10;
        };
      };
      dynamic_padding = false;
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
          foreground = "#c2c2b0";
          background = "#121212";
        };
        cursor = {
          text = "#121212";
          cursor = "#c2c2b0";
        };
        normal = {
          black = "#666666";
          red = "#5F8787";
          green = "#444444";
          yellow = "#666666";
          blue = "#888888";
          magenta = "#999999";
          cyan = "#aaaaaa";
          white = "#c1c1c1";
        };
        bright = {
          black = "#666666";
          red = "#5F8787";
          green = "#444444";
          yellow = "#666666";
          blue = "#888888";
          magenta = "#999999";
          cyan = "#aaaaaa";
          white = "#c1c1c1";
        };
      };
    };
  };
}
