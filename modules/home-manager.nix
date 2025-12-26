{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.amod = {
      imports = [
        ./neovim
        ./tmux.nix
        ./catppuccin.nix
        ./opencode.nix
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
