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
  boot.loader.systemd-boot.configurationLimit = 5;
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

  # Disk space
  nix.settings = {
    auto-optimise-store = true;
    min-free = 10 * 1024 * 1024 * 1024; # GC during builds when <10G free...
    max-free = 30 * 1024 * 1024 * 1024; # ...until 30G free
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  services.journald.settings.Journal.SystemMaxUse = "500M";

  # Services
  services.openssh.enable = true;

  # Shell
  programs.zsh.enable = true;

  system.stateVersion = "24.05";
}
