{
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    zsh = {
      enable = true;
      initContent = ''
        eval "$(direnv hook zsh)"
      '';
    };
  };
}
