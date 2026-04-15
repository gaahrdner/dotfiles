{ ... }: {
  xdg.configFile."ghostty/config".text = ''
    font-size = 14
    theme = dark:GruvboxDark,light:GruvboxLight
    window-padding-x = 4
    window-padding-y = 4
  '';
}
