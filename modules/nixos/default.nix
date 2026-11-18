{ lib, ... }:
{
  imports = [
    ./common.nix
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

  users.users.amod.extraGroups = [ "networkmanager" ];

  # Services
  services.openssh.enable = true;

  system.stateVersion = "24.05";
}
