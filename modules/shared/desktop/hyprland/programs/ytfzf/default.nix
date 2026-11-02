{pkgs, ...}: {
  home.packages = with pkgs; [
    ytfzf
    fzf
    jq
    yt-dlp
    rofi
    playerctl
  ];

  programs.mpv = {
    enable = true;
    scripts = [pkgs.mpvScripts.mpris];
  };

  xdg.configFile."ytfzf/conf.sh".text = ''
    scrape="youtube"
    search_source="prompt"
    is_audio_only=1
    interface="ext"
    external_menu_len=20

    external_menu () {
        rofi -dmenu -i -p "󰎈 YouTube Music:"
    }

    player_raw="mpv"
  '';
}
