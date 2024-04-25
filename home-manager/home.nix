{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./modules/bundle.nix
  ];

  # colorScheme = inputs.nix-colors.lib.schemeFromYAML "cool-scheme" 
  #   (builtins.readFile
  #     (builtins.fetchurl({
  #       url = "https://raw.githubusercontent.com/chawyehsu/base16-snazzy-scheme/master/snazzy.yaml";
  #       sha256 = "1c7v83rqd0c7nfb24ki3a8zz8vdk6i16jpdzpncv7kc9i371qgv1";
  #     })));

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  home = {
    username = "dan";
    homeDirectory = "/home/dan";
    stateVersion = "23.11";
  };
}
