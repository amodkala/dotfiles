{ config, pkgs, ... }:

{
    imports = [ 
        ./hardware-configuration.nix
    ];


    nix = {
        package = pkgs.nixFlakes;
        extraOptions = ''
            experimental-features = nix-command flakes
        '';
    };

    boot.kernelPackages = pkgs.linuxPackages_latest;
    
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

# Set your time zone.
    time.timeZone = "America/Toronto";

# Select internationalisation properties.
    i18n.defaultLocale = "en_CA.UTF-8";

# Configure keymap in X11
    services.xserver = {
        enable = true;
        layout = "us";
        xkbVariant = "";
        libinput = {
            enable = true;
            touchpad.naturalScrolling = true;
        };
        displayManager.startx.enable = true;
    };

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.amod = {
        isNormalUser = true;
        description = "amod";
        extraGroups = [ "networkmanager" "wheel" "video" ];
    };

    programs.light.enable = true;

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = with pkgs; [
        neovim 
        wget
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
    system.stateVersion = "22.11"; # Did you read the comment?

}
