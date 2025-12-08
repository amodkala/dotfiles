{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Let Determinate Nix handle your Nix configuration
  nix.enable = false;

  # Custom Determinate Nix settings written to /etc/nix/nix.custom.conf
  determinate-nix.customSettings = {
    # Enables parallel evaluation (remove this setting or set the value to 1 to disable)
    eval-cores = 0;
    extra-experimental-features = [
      "build-time-fetch-tree" # Enables build-time flake inputs
      "parallel-eval" # Enables parallel evaluation
    ];
  };
}
