{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-terminal
  ];
  dconf.enable = true;
  programs.gnome-shell = {
    enable = true;
    theme = {
      name = "Marble-purple-dark";
      package = pkgs.marble-shell-theme;
    };
  };
}
