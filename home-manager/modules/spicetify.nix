{ pkgs, lib, config, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify =
    {
      enable = true;
      theme = spicePkgs.themes.text;
      colorScheme = "custom";

      customColorScheme = {
        text = "${config.colorScheme.palette.base03}";
        subtext = "${config.colorScheme.palette.base07}";
        extratext = "${config.colorScheme.palette.base03}";
        main = "${config.colorScheme.palette.base00}";
        sidebar = "${config.colorScheme.palette.base00}";
        player = "${config.colorScheme.palette.base00}";
        sec-player = "${config.colorScheme.palette.base03}";
        card = "${config.colorScheme.palette.base01}";
        sec-card = "${config.colorScheme.palette.base03}";
        shadow = "${config.colorScheme.palette.base00}";
        selected-row = "${config.colorScheme.palette.base07}";
        button = "${config.colorScheme.palette.base03}";
        button-active = "${config.colorScheme.palette.base03}";
        button-disabled = "${config.colorScheme.palette.base03}";
        button-knob = "${config.colorScheme.palette.base08}";
        tab-active = "${config.colorScheme.palette.base08}";
        notification = "${config.colorScheme.palette.base08}";
        notification-error = "${config.colorScheme.palette.base01}";
        misc = "${config.colorScheme.palette.base03}";
      };

#      enabledExtensions = with spicePkgs.extensions; [
#        shuffle
#      ];
    };
}