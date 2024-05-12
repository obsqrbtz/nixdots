{config, nixpkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = ["hyprland/workspaces" "hyprland/submap"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "hyprland/language" "keyboard-state" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

    "hyprland/language" = {
        format-en = "us";
        format-ru = "ru";
	      min-length = 3;
	      tooltip = false;
    };

    "keyboard-state" = {
        #numlock = true;
        capslock = true;
        format = "{icon} ";
        format-icons = {
            locked = "";
            unlocked = "";
        };
    };

    "clock" = {
        # timezone = "America/New_York";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%a %d %b %I:%M %p}";
    };

    "pulseaudio" = {
        # scroll-step = 1; # %, can be a float
        reverse-scrolling = 1;
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
        };
        on-click = "pavucontrol";
        min-length = 13;
    };

    tray = {
        icon-size = 16;
        spacing = 2;
    };

      };
    };
  
    style = 
      ''
* {
    border: none;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: Mononoki Nerd Font;
    font-size: 14px;
    /*font-weight: bold; */
    min-height: 20px;
}

window#waybar {
    background: #${config.colorScheme.palette.base00};
    padding: 1px;
}

window#waybar.hidden {
    opacity: 0.2;
}

#workspaces {
    margin-right: 8px;
    padding-right: 4px;
    padding-left: 4px;
    border-radius: 0px;
    transition: none;
    background: #${config.colorScheme.palette.base00};
}

#workspaces button {
    margin: 8px;
    transition: none;
    border-radius: 0px;
    color: #${config.colorScheme.palette.base07};
    background: transparent;
    padding: 5px;
}

#workspaces button.persistent {
    color: #${config.colorScheme.palette.base07};
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: 0px;
    color: #${config.colorScheme.palette.base00};
    background: #${config.colorScheme.palette.base07};
}

#workspaces button.active {
    background: #${config.colorScheme.palette.base03};
    color: #${config.colorScheme.palette.base00};
}

#language {
    transition: none;
    color: #${config.colorScheme.palette.base07};
    background: #${config.colorScheme.palette.base00};
}

#keyboard-state {
    padding: 5px;
    margin-right: 8px;
    transition: none;
    color: #${config.colorScheme.palette.base07};
    background: #${config.colorScheme.palette.base00};
}

#submap {
    transition: none;
    color: #${config.colorScheme.palette.base07};
    background: #${config.colorScheme.palette.base00};
}

#clock {
    transition: none;
    color: #${config.colorScheme.palette.base07};
    background: #${config.colorScheme.palette.base00};
}

#pulseaudio {
    margin: 4px;
    padding: 5px;
    transition: none;
    color: #${config.colorScheme.palette.base07};
    background: #${config.colorScheme.palette.base00};
}

#pulseaudio.muted {
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base07};
}

#tray {
    margin-right: 16px;
    transition: none;
    color: #${config.colorScheme.palette.base05};
    background: #${config.colorScheme.palette.base00};
}

@keyframes blink {
    to {
        background-color: #${config.colorScheme.palette.base07};
        color: #${config.colorScheme.palette.base00};
    }
}
      '';
  };
}
