{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.amod = {
      imports = [
        ./claude
        ./neovim
        ./opencode

        ./catppuccin.nix
        ./ghostty.nix
        ./tmux.nix
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
