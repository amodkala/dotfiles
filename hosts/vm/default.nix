# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ../../hosts
    ./hardware-configuration.nix
  ];

  nix = {
    buildMachines = [
      {
        hostName = "nixbuild.vital.company";
        system = "x86_64-linux";
        maxJobs = 64;
        speedFactor = 2;
        supportedFeatures = [
          "benchmark"
          "big-parallel"
        ];
      }
      {
        hostName = "nixbuild.vital.company";
        system = "aarch64-linux";
        maxJobs = 64;
        speedFactor = 2;
        supportedFeatures = [
          "benchmark"
          "big-parallel"
        ];
      }
    ];
    # buildMachines = [
    #   {
    #     hostName = "hydra-aarch64";
    #     sshUser = "amod";
    #     sshKey = "/home/amod/.ssh/id_rsa";
    #     system = "aarch64-linux";
    #     maxJobs = 4;
    #     speedFactor = 2;
    #     supportedFeatures = [
    #       "nixos-test"
    #       "benchmark"
    #       "big-parallel"
    #       "kvm"
    #     ];
    #     mandatoryFeatures = [ ];
    #   }
    #   {
    #     hostName = "hydra-x8664";
    #     sshUser = "amod";
    #     sshKey = "/home/amod/.ssh/id_rsa";
    #     system = "x86_64-linux";
    #     maxJobs = 4;
    #     speedFactor = 2;
    #     supportedFeatures = [
    #       "nixos-test"
    #       "benchmark"
    #       "big-parallel"
    #       "kvm"
    #     ];
    #     mandatoryFeatures = [ ];
    #   }
    # ];
    distributedBuilds = true;
    extraOptions = ''
      builders-use-substitutes = false
      build-cores = 0
      keep-outputs = true
      keep-derivations = false
    '';
    settings.trusted-users = [ "amod" ];
  };

  programs.ssh = {
    extraConfig = ''
      Host nixbuild.vital.company
        Port 2222
        PubkeyAcceptedKeyTypes ssh-ed25519
        ServerAliveInterval 60
        IPQoS throughput
        IdentityFile /home/amod/.ssh/id_nixbuild
    '';

    knownHosts = {
      nixbuild = {
        hostNames = [ "nixbuild.vital.company" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+jBIzENqxs/p7dFEAIjG8e5TT+A9Gvhi1cKNdIJ9vW";
      };
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless = {
    enable = false; # Enables wireless support via wpa_supplicant.
    interfaces = [ "enp0s1" ];
  };
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };
  networking.wireguard = {
    enable = true;
    interfaces.wg0 = {
      ips = [ "192.168.5.129/32" ];
      listenPort = 51820;
      privateKeyFile = "~/.office-vpn/private.key";
      peers = [
        {
          publicKey = "KWwb4c8l4gDtehAARxiE8+M27viZoRoMRtvKJpxjwmk=";
          allowedIPs = [
            "192.168.5.1/32"
            "192.168.5.129/32"
            "172.16.0.0/16"
            "192.168.100.0/22"
            "192.168.150.0/22"
            "192.168.200.0/23"
            "192.168.250.0/23"
            "192.168.1.0/24"
          ];
          endpoint = "72.142.27.218:51820";
        }
      ];
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  services.tailscale.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  # hardware.pulseaudio.enable = false;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amod = {
    isNormalUser = true;
    description = "Amod Kala";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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
  system.stateVersion = "24.05"; # Did you read the comment?

}
