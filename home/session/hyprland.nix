{ config, pkgs, ... }:

{

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, Space, exec, rofi -show drun"
      ];

      # Example window rules, animations, etc.
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" ];
      };
    };
    style = ''
      * {
        background: #1e1e2e;
        color: #cdd6f4;
      }
      /* Add more dark theme styling */
    '';
  };

  programs.kitty = {
    enable = true;
    themeFile = "flexoki_dark";
  };
}
