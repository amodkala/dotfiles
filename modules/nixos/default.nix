{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.wireless.enable = lib.mkForce false;
  networking.firewall = {
    allowedTCPPorts = [ 5173 8080 ]; # Vite dev server, magi API
    allowedUDPPorts = [ 51820 ]; # WireGuard
  };

  # Locale
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # User
  users.users.amod = {
    isNormalUser = true;
    description = "Amod Kala";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Packages
  nixpkgs.config.allowUnfree = true;

  # Services
  services.openssh.enable = true;

  # Shell
  programs.zsh.enable = true;

  system.stateVersion = "24.05";
}
