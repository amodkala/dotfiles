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
      };
      home.stateVersion = "25.11";
    };
  };
}
