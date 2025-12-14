{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./home/common.nix
    ./home/session/gnome.nix
    ./home/session/hyprland.nix
  ];

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

}
