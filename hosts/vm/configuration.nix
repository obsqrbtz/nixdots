{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/session/gnome.nix
    ../../modules/session/i3.nix
  ];

  networking.hostName = "nixos-vm";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 3;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  system.stateVersion = "24.11";
}
