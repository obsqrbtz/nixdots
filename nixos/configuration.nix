{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
    ];

  boot.loader.systemd-boot.enable = true;
  # boot.loader = {
  #   efi.canTouchEfiVariables = true;
  #   grub = {
  #     enable = true;
  #     devices = [ "nodev" ];
  #     efiSupport = true;
  #     useOSProber = true;
  #   };
  # };

  time.hardwareClockInLocalTime = true;

  networking.hostName = "nixos";

  services.udisks2.enable = true;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  hardware.graphics.enable32Bit = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11";

}
