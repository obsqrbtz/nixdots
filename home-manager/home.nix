{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./modules/bundle.nix
  ];

  # colorScheme = inputs.nix-colors.lib.schemeFromYAML "palette" 
  #   (builtins.readFile
  #     (builtins.fetchurl({
  #       url = "https://raw.githubusercontent.com/metalelf0/base16-black-metal-scheme/master/black-metal.yaml";
  #       sha256 = "sha256:0fba5l8yx9lxppqn7gcdc371c4rdc27iyfk56vfjzxpgs40qr439";
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
