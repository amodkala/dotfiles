{ config, pkgs, ... }:
{
  imports = [
    ./tmux.nix
    ./catppuccin.nix
    ./neovim
    ./ghostty.nix
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

    neovim.package = pkgs.neovim;
  };

  home.stateVersion = "25.11";
}
