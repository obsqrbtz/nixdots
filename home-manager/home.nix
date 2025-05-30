{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./modules/bundle.nix
  ];

  gtk = {
    enable = true;
    font.name = "Mononoki Nerd Font 12";
    theme = {
      name = "Gruvbox-Dark-BL-LB";
      package = pkgs.gruvbox-gtk-theme;
    };
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };
    iconTheme = {
      name = "Tango";
      package = pkgs.tango-icon-theme;
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice"; 
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home = {
    username = "dan";
    homeDirectory = "/home/dan";
    stateVersion = "24.11";
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    GTK_THEME = "${config.gtk.theme.name}";
    XCURSOR_SIZE = "24";
  };

}
