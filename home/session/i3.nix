{ config, pkgs, ... }:

{

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";

      terminal = "alacritty";
      startup = [{
        command =
          "sh -c 'xrandr --output Virtual-1 --mode 1920x1080 && sleep 0.1 && feh --bg-scale ~/nixdots/img/wall.jpg'";
        notification = false;
      }];
      defaultWorkspace = "workspace 1";
      bars = [ ];
      keybindings = let
        mod = "Mod4";
        workspace = {
          term = "term";
          code = "code";
          web = "web";
          ws4 = "ws4";
          ws5 = "ws5";
          ws6 = "ws6";
          ws7 = "ws7";
          ws8 = "ws8";
          ws9 = "ws9";
        };
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

        # --- Workspace switching ---
        "${mod}+1" = "workspace ${workspace.term}";
        "${mod}+2" = "workspace ${workspace.code}";
        "${mod}+3" = "workspace ${workspace.web}";
        "${mod}+4" = "workspace ${workspace.ws4}";
        "${mod}+5" = "workspace ${workspace.ws5}";
        "${mod}+6" = "workspace ${workspace.ws6}";
        "${mod}+7" = "workspace ${workspace.ws7}";
        "${mod}+8" = "workspace ${workspace.ws8}";
        "${mod}+9" = "workspace ${workspace.ws9}";

        # --- Move container to workspace ---
        "${mod}+Shift+1" = "move container to ${workspace.term}";
        "${mod}+Shift+2" = "move container to ${workspace.code}";
        "${mod}+Shift+3" = "move container to ${workspace.web}";
        "${mod}+Shift+4" = "move container to ${workspace.ws4}";
        "${mod}+Shift+5" = "move container to ${workspace.ws5}";
        "${mod}+Shift+6" = "move container to ${workspace.ws6}";
        "${mod}+Shift+7" = "move container to ${workspace.ws7}";
        "${mod}+Shift+8" = "move container to ${workspace.ws8}";
        "${mod}+Shift+9" = "move container to ${workspace.ws9}";

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
      window = {
        border = 2;
        titlebar = false;
      };

      gaps = {
        inner = 10;
        top = 30;
      };

      colors = {
        focused = {
          border = "#88c0d0";
          background = "#88c0d0";
          text = "#2e3440";
          indicator = "#88c0d0";
          childBorder = "#88c0d0";
        };

        focusedInactive = {
          border = "#4c566a";
          background = "#3b4252";
          text = "#d8dee9";
          indicator = "#3b4252";
          childBorder = "#3b4252";
        };

        unfocused = {
          border = "#4c566a";
          background = "#3b4252";
          text = "#d8dee9";
          indicator = "#3b4252";
          childBorder = "#3b4252";
        };

        urgent = {
          border = "#bf616a";
          background = "#bf616a";
          text = "#eceff4";
          indicator = "#bf616a";
          childBorder = "#bf616a";
        };

        background = "#2e3440";
      };
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };

  home.file.".config/polybar/config.ini".source =
    ../../config/polybar/config.ini;

  services.polybar = {
    enable = true;
    script = "pkill -USR1 polybar || true && polybar &";

  };

  services.picom = {
    enable = true;
    fade = true;
    shadow = true;
  };

  programs.alacritty = { enable = true; };
}
