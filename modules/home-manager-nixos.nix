{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.amod = {
      imports = [
        ./claude
        ./neovim

        ./catppuccin.nix
        ./ripgrep.nix
        ./tmux.nix
        ./vcs.nix
        ./zsh.nix
      ];

      programs.home-manager.enable = true;
      home.stateVersion = "25.11";
    };
  };

}
