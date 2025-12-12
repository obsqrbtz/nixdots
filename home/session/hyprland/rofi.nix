{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = "~/.config/rofi/clrsync.rasi";
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
  };
}
