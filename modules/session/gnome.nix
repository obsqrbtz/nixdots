{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.appindicator
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany # gnome browser
    geary # email client
  ];
}
