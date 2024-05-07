# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
    imports = [ 
        ./hardware-configuration.nix
    ];

# Nix
    nix = {
        package = pkgs.nixFlakes;
        extraOptions = ''
            experimental-features = nix-command flakes
            '';
    };

# Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot";
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "inspiron16plus"; # Define your hostname.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
    networking.networkmanager = { enable = true; };

# Set your time zone.
    time.timeZone = "America/Toronto";

# Select internationalisation properties.
    i18n.defaultLocale = "en_CA.utf8";

# Configure keymap in X11
    services.xserver = {
        enable = true;
        layout = "us";
        xkbVariant = "";
        libinput = {
            enable = true;
            touchpad = {
                tapping = true;
                naturalScrolling = true;
                scrollMethod = "twofinger";
            };
        };
        displayManager.startx.enable = true;
    };

    # services.throttled = {
    #     enable = true;
    #     extraConfig = ''
    #         [UNDERVOLT]
    #         CORE: -125
    #     '';
    # };

    programs = {
        light.enable = true;
        fish.enable = true;

        ssh.startAgent = true;
    };

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.amod = {
        isNormalUser = true;
        description = "amod";
        extraGroups = [ "networkmanager" "wheel" "video" ];
        shell = pkgs.fish;
        packages = with pkgs; [ ];
    };

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = with pkgs; [
        neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        git
    ];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11"; # Did you read the comment?

}
