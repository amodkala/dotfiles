{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.amod = {
      imports = [
        ./neovim
        ./opencode

        ./tmux.nix
        ./catppuccin.nix
        ./ghostty.nix
        ./zsh.nix
      ];
      programs = {
        home-manager.enable = true;

        git = {
          enable = true;
          settings.user = {
            name = "amodkala";
            email = "amodkala@gmail.com";
          };
        };
      };
      home.stateVersion = "25.11";
    };
  };

}
