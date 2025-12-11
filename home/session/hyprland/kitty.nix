{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      background_opacity = "0.95";
      window_padding_width = 12;
      confirm_os_window_close = 0;
      enable_audio_bell = false;

      foreground = "#fafafa";
      background = "#0a0a0a";
      selection_foreground = "#0a0a0a";
      selection_background = "#fafafa";

      cursor = "#fafafa";
      cursor_text_color = "#0a0a0a";

      url_color = "#3b82f6";

      active_border_color = "#fafafa";
      inactive_border_color = "#333333";
      bell_border_color = "#f59e0b";

      active_tab_foreground = "#fafafa";
      active_tab_background = "#141414";
      inactive_tab_foreground = "#737373";
      inactive_tab_background = "#0a0a0a";
      tab_bar_background = "#0a0a0a";

      color0 = "#0a0a0a";
      color1 = "#ef4444";
      color2 = "#22c55e";
      color3 = "#f59e0b";
      color4 = "#3b82f6";
      color5 = "#a855f7";
      color6 = "#0ea5e9";
      color7 = "#a3a3a3";

      color8 = "#737373";
      color9 = "#f87171";
      color10 = "#4ade80";
      color11 = "#fbbf24";
      color12 = "#60a5fa";
      color13 = "#c084fc";
      color14 = "#22d3ee";
      color15 = "#fafafa";
    };
  };
}
