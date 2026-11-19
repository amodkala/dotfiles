{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [
    5173
    8080
  ]; # Vite dev server, magi API

  # Locale
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # User
  users.users.amod = {
    isNormalUser = true;
    description = "Amod Kala";
    extraGroups = [ "wheel" ];
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [ pkgs.ghostty.terminfo ];

  nix.package = pkgs.nixVersions.latest;

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

  # Shell
  programs.zsh.enable = true;
}
