{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 320;
        height = 300;
        origin = "top-right";
        offset = "10x50";
        scale = 0;
        notification_limit = 5;
        progress_bar = true;
        progress_bar_height = 8;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 4;
        indicate_hidden = true;
        transparency = 0;
        separator_height = 1;
        padding = 12;
        horizontal_padding = 14;
        text_icon_padding = 12;
        frame_width = 1;
        frame_color = "#333333";
        gap_size = 6;
        separator_color = "#262626";
        sort = true;
        font = "JetBrainsMono Nerd Font 10";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 48;
        icon_theme = "Papirus-Dark";
        corner_radius = 8;
        sticky_history = true;
        history_length = 20;
        browser = "${pkgs.firefox}/bin/firefox";
        always_run_script = true;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };

      urgency_low = {
        background = "#141414";
        foreground = "#a3a3a3";
        frame_color = "#262626";
        timeout = 8;
      };

      urgency_normal = {
        background = "#141414";
        foreground = "#fafafa";
        frame_color = "#333333";
        timeout = 10;
      };

      urgency_critical = {
        background = "#141414";
        foreground = "#fafafa";
        frame_color = "#ef4444";
        timeout = 0;
      };
    };
  };
}
