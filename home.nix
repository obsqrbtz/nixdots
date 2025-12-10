{ pkgs, inputs, ... }:

{
  home.username = "dan";
  home.homeDirectory = "/home/dan";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    inputs.clrsync.packages.x86_64-linux.clrsync
  ];

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
