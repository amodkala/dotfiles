{ 
  config, 
    system,
    pkgs, 
    ... 
}:
{
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
