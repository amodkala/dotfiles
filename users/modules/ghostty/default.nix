{
  programs.ghostty = { 
    enable = true;
    package = null; # broken on darwin
    clearDefaultKeybinds = true;
    settings = {
      font-feature = "-calt, -liga, -dlig";
      cursor-style = "block";
      cursor-style-blink = false;
      window-colorspace = "display-p3";
      maximize = true;
      keybind = [
        "performable:cmd+c=copy_to_clipboard"
        "performable:cmd+v=paste_from_clipboard" 
        "cmd+q=quit"
      ];
      command = "/Users/amodkala/dotfiles/users/modules/ghostty/tmux.sh";
    };
  };
}
