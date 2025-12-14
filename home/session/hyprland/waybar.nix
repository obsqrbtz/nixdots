{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 4;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "tray"
        ];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
            default = "";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };
        "hyprland/window" = {
          format = "{}";
          max-length = 50;
          empty_format = "";
        };
        clock = {
          format = "{:%H:%M}";
          format-alt = " {:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#fafafa'><b>{}</b></span>";
              days = "<span color='#a3a3a3'><b>{}</b></span>";
              weeks = "<span color='#737373'><b>W{}</b></span>";
              weekdays = "<span color='#a3a3a3'><b>{}</b></span>";
              today = "<span color='#3b82f6'><b><u>{}</u></b></span>";
            };
          };
        };
        cpu = {
          format = " {usage}%";
          tooltip = false;
        };
        memory = {
          format = " {percentage}%";
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
        network = {
          format-wifi = " {essid}";
          format-ethernet = "  {ifname}";
          format-linked = "󰈁 {ifname}";
          format-disconnected = "󱚼 Disconnected";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%) 󰖩";
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂯 {volume}%";
          format-bluetooth-muted = "󰂲";
          format-muted = "󰖁 {volume}%";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋎";
            headset = "󰋎";
            phone = "󰄜";
            portable = "󰄜";
            car = "󰄋";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pavucontrol";
        };
        tray = {
          icon-size = 18;
          spacing = 10;
        };
      };
    };
    style = builtins.readFile ../../../config/waybar/style.css;
  };
}
