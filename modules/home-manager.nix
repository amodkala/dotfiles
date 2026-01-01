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
        ./vcs.nix
        ./zsh.nix
      ];

      programs.home-manager.enable = true;
      home.stateVersion = "25.11";
    };
  };

}
