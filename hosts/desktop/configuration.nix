{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/session/gnome.nix
    ../../modules/session/hyprland.nix
    ../../modules/session/i3.nix
  ];

  networking.hostName = "nixos-desktop";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [ pciutils usbutils ];

  system.stateVersion = "24.11";
}
