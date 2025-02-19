{ 
  config, 
    system,
    pkgs, 
    ... 
}:
{
# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ 
    neovim
    git
  ];

  nix = {
    package = pkgs.nix;
    optimise = {
      automatic = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
