{ config, pkgs, ... }:

{

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";

      terminal = "alacritty";
      startup = [
        { command = "${pkgs.polybar}/bin/polybar"; }
        { command = "xrandr --output Virtual-1 --mode 1920x1080"; }
      ];
      bars = [ ];
      keybindings = let mod = "Mod4";
      in {
        # Terminal
        "${mod}+Return" = "exec alacritty";

        # Close/exit
        "${mod}+q" = "kill";
        "${mod}+m" = "exit";

        # File manager / apps
        "${mod}+e" = "exec $fileManager";
        "${mod}+d" = "exec rofi -show drun";

        "${mod}+Shift+space" = "floating toggle";

        # Window focus (arrow keys)
        "${mod}+Left" = "focus left";
        "${mod}+Right" = "focus right";
        "${mod}+Up" = "focus up";
        "${mod}+Down" = "focus down";

        "${mod}+1" = "workspace 1";
        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+0" = "workspace 10";
        "${mod}+Shift+0" = "move container to workspace 10";

        # Scratchpad / special workspace
        "${mod}+o" = "scratchpad show"; # toggle scratchpad
        "${mod}+Shift+s" = "move container to scratchpad";

        # Scroll through workspaces (mouse)
        "${mod}+button4" = "workspace next";
        "${mod}+button5" = "workspace prev";

        # Move/resize windows with mouse
        "Mod4+Button1" = "move";
        "Mod4+Button3" = "resize";
      };

      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };

  home.file.".config/polybar/config.ini".source =
    ../../config/polybar/config.ini;

  services.picom = {
    enable = true;
    fade = true;
    shadow = true;
  };

  programs.alacritty = { enable = true; };
}
