{ config, pkgs, ... }:
{
  dconf.enable = true;
  programs.gnome-shell = {
    enable = true;
    theme = {
      name = "Marble-purple-dark";
      package = pkgs.marble-shell-theme;
    };
  };
}
