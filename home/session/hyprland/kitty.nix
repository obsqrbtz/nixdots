{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = "include ./clrsync.conf";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {

      background_opacity = "0.95";
      window_padding_width = 12;
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      hide_window_decorations = true;
      cursor_trail = 1;
    };
  };
}
