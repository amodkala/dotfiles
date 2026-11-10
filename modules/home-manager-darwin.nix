{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.amodkala = {
      imports = [
        ./claude
        ./neovim

        ./catppuccin.nix
        ./ghostty.nix
        ./ripgrep.nix
        ./vcs.nix
        ./zsh.nix
      ];

      programs.home-manager.enable = true;
      home.stateVersion = "25.11";
    };
  };
}
