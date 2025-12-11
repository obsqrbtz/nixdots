{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      drun-display-format = "{name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "󰵆 Apps";
      display-run = " Run";
      display-window = " Windows";
      sidebar-mode = true;
      font = "JetBrainsMono Nerd Font 11";
    };
    theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
      "*" = {
        bg = mkLiteral "#0a0a0a";
        bg-alt = mkLiteral "#141414";
        bg-selected = mkLiteral "#1a1a1a";
        
        fg = mkLiteral "#fafafa";
        fg-alt = mkLiteral "#a3a3a3";
        
        border = mkLiteral "#333333";
        border-alt = mkLiteral "#262626";

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg";
        
        margin = 0;
        padding = 0;
        spacing = 0;
      };

      "window" = {
        location = mkLiteral "center";
        width = 640;
        background-color = mkLiteral "@bg";
        border = mkLiteral "1px";
        border-color = mkLiteral "@border";
        border-radius = mkLiteral "8px";
      };

      "mainbox" = {
        padding = mkLiteral "12px";
      };

      "inputbar" = {
        spacing = mkLiteral "8px";
        padding = mkLiteral "12px 14px";
        background-color = mkLiteral "@bg-alt";
        border = mkLiteral "1px";
        border-color = mkLiteral "@border-alt";
        border-radius = mkLiteral "6px";
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "prompt" = {
        text-color = mkLiteral "@fg";
      };

      "message" = {
        margin = mkLiteral "12px 0 0";
        border = mkLiteral "1px";
        border-color = mkLiteral "@border-alt";
        border-radius = mkLiteral "6px";
        background-color = mkLiteral "@bg-alt";
      };

      "textbox" = {
        padding = mkLiteral "12px 14px";
      };

      "listview" = {
        margin = mkLiteral "12px 0 0";
        lines = 8;
        columns = 1;
        fixed-height = false;
        scrollbar = false;
      };

      "element" = {
        padding = mkLiteral "10px 12px";
        spacing = mkLiteral "12px";
        border-radius = mkLiteral "6px";
      };

      "element normal normal" = {
        text-color = mkLiteral "@fg-alt";
      };

      "element normal active" = {
        text-color = mkLiteral "@fg";
      };

      "element selected normal, element selected active" = {
        background-color = mkLiteral "@bg-selected";
        text-color = mkLiteral "@fg";
        border = mkLiteral "1px";
        border-color = mkLiteral "@border";
      };

      "element-icon" = {
        size = mkLiteral "1.2em";
        vertical-align = mkLiteral "0.5";
      };

      "element-text" = {
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };

      "mode-switcher" = {
        margin = mkLiteral "12px 0 0";
        spacing = mkLiteral "6px";
      };

      "button" = {
        padding = mkLiteral "10px 14px";
        background-color = mkLiteral "@bg-alt";
        border = mkLiteral "1px";
        border-color = mkLiteral "@border-alt";
        border-radius = mkLiteral "6px";
        text-color = mkLiteral "@fg-alt";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-selected";
        border-color = mkLiteral "@border";
        text-color = mkLiteral "@fg";
      };
    };
  };
}
