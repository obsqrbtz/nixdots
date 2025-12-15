{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/session/gnome.nix
    ../../modules/session/hyprland.nix
  ];

  networking.hostName = "nixos-desktop";

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.8.0.3/24" ];
      dns = [ "1.1.1.1" ];
      privateKeyFile = "/etc/wireguard/timeweb-privatekey";
      peers = [
        {
          publicKey = "zhA5ve2B4Mc93iG3s3TY2Z0kQDm/EkXu+dLNSsm7JRU=";
          presharedKeyFile = "/etc/wireguard/timeweb-preshared";
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
          endpoint = "45.139.77.74:51820";
        }
      ];
    };
  };

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    pciutils
    usbutils
  ];

  system.stateVersion = "24.11";
}
