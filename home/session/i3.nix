{ config, pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4"; # Super key

      terminal = "alacritty";

      keybindings = let mod = "Mod4";
      in {
        "${mod}+Return" = "exec alacritty";
        "${mod}+q" = "kill";
        "${mod}+d" = "exec rofi -show drun";
        "${mod}+Shift+e" = "exec i3-msg exit";

        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        # ... add more
      };

      bars = [{
        position = "top";
        statusCommand = "${pkgs.i3status}/bin/i3status";
      }];

      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };

  services.picom = {
    enable = true;
    fade = true;
    shadow = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#ffffff";
          foreground = "#000000";
        };
      };
    };
  };
}
