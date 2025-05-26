{ config, pkgs, lib, ... }:

let
  # Import your color scheme from nix-colors
  colors = config.colorScheme.palette;
in {
  programs.wofi = {
    enable = true;
    settings = {
      # General appearance
      width = 600;
      height = 400;
      location = "center";
      allow_markup = true;
      always_parse_args = true;
      hide_scroll = true;
      line_wrap = "off";
      dynamic_lines = false;
      prompt = "Search...";
      
      # Colors using nix-colors variables
      background_color = "#${colors.base00}";
      border_color = "#${colors.base0E}";
      separator_color = "#${colors.base08}";
      
      # Text colors
      normal_background = "#${colors.base00}";
      normal_foreground = "#${colors.base07}";
      selected_background = "#${colors.base0E}";
      selected_foreground = "#${colors.base00}";
      selected_argument_background = "#${colors.base0E}";
      selected_argument_foreground = "#${colors.base00}";
      active_background = "#${colors.base0D}";
      active_foreground = "#${colors.base07}";
      urgent_background = "#${colors.base01}";
      urgent_foreground = "#${colors.base07}";
      
      # Alternate row colors
      alternate_background = "#${colors.base08}";
      alternate_foreground = "#${colors.base07}";
      
      # Input bar colors
      input_background = "#${colors.base00}";
      input_foreground = "#${colors.base07}";
      input_border = "#${colors.base0E}";
      
      # Window border
      border_width = 2;
      border_radius = 8;
    };
    
    # Optional style.css for more advanced styling
    style = ''
      window {
        margin: 0px;
        border: 2px solid #${colors.base0E};
        border-radius: 8px;
        background-color: #${colors.base00};
        font-family: "Fira Code", monospace;
        font-size: 14px;
      }
      
      #input {
        margin: 5px;
        border: 2px solid #${colors.base0E};
        border-radius: 4px;
        color: #${colors.base07};
        background-color: #${colors.base00};
      }
      
      #inner-box {
        margin: 5px;
        border: none;
        background-color: #${colors.base00};
      }
      
      #outer-box {
        margin: 5px;
        border: none;
        background-color: #${colors.base00};
      }
      
      #scroll {
        margin: 0px;
        border: none;
      }
      
      #text {
        margin: 5px;
        border: none;
        color: #${colors.base07};
      } 
      
      #entry:selected {
        background-color: #${colors.base0E};
        color: #${colors.base00};
        border-radius: 4px;
      }
      
      #entry:selected #text {
        color: #${colors.base00};
      }
    '';
  };
}
