_: {
  programs.kitty = {
    enable = true;

    settings = {
      window_padding_width = 12;
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      scrollback_lines = 10000;

      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";

      hide_window_decorations = "yes";
      cursor_shape = "beam";
      cursor_blink_interval = 0;
      mouse_hide_wait = "3.0";
      detect_urls = true;

      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
    };
  };
}
