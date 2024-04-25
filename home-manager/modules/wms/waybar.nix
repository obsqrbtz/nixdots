{config, nixpkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18";

        modules-left = ["hyprland/workspaces" "hyprland/language" "keyboard-state" "hyprland/submap"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "custom/mem" "cpu" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

    "hyprland/language" = {
        format-en = "US";
        format-ru = "RU";
	      min-length = 5;
	      tooltip = false;
    };

    "keyboard-state" = {
        #numlock = true;
        capslock = true;
        format = "{icon} ";
        format-icons = {
            locked = " ";
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

    "custom/mem" = {
        format = "{} ";
        interval = 3;
        exec = "free -h | awk '/Mem:/{printf $3}'";
        tooltip = false;
    };

    "cpu" = {
      interval = 2;
      format = "{usage}% ";
      min-length = 6;
    };

    tray = {
        icon-size = 16;
        spacing = 0;
    };

      };
    };
  
    style = 
      ''
* {
    border: none;
    border-radius: 0;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: JetBrains Mono;
    font-weight: bold; 
    min-height: 20px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0.2;
}

#workspaces {
    margin-right: 8px;
    padding-right: 4px;
    padding-left: 4px;
    border-radius: 10px;
    transition: none;
    background: #121212;
}

#workspaces button {
    margin: 8px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: transparent;
    padding: 5px;
    font-size: 14px;
}

#workspaces button.persistent {
    color: #${config.colorScheme.palette.base0F};
    font-size: 12px;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #${config.colorScheme.palette.base00};
    background: #${config.colorScheme.palette.base0F};
}

#workspaces button.active {
    background: #${config.colorScheme.palette.base09};
    color: white;
    border-radius: inherit;
}

#language {
    padding-left: 16px;
    padding-right: 8px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

#keyboard-state {
    margin-right: 8px;
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

#submap {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

#clock {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

#pulseaudio {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

#pulseaudio.muted {
    background-color: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base0F};
}

#custom-mem {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

#cpu {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

#temperature {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

#temperature.critical {
    background-color: #${config.colorScheme.palette.base01};
}

#tray {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #${config.colorScheme.palette.base0F};
    background: #${config.colorScheme.palette.base00};
}

@keyframes blink {
    to {
        background-color: #${config.colorScheme.palette.base0F};
        color: #${config.colorScheme.palette.base00};
    }
}
      '';
  };
}
