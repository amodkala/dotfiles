{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.amod = {
      imports = [
        inputs.catppuccin.homeModules.catppuccin
        ./neovim
        ./claude
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
