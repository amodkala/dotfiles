{
  programs.ghostty = {
    enable = true;
    package = null; # broken on darwin
    settings = {
      font-feature = "-calt, -liga, -dlig";
      cursor-style = "block";
      cursor-style-blink = false;
      window-colorspace = "display-p3";
      shell-integration-features = "title, ssh-env";
      auto-update-channel = "tip";
    };
  };
}
