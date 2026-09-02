{ lib, pkgs, ... }:
let
  sshKeyPath = if pkgs.stdenv.isDarwin
    then "/Users/amodkala/.ssh/id_nixbuild"
    else "/home/amod/.ssh/id_nixbuild";
in
{
  programs.ssh = {
    extraConfig = ''
      Host nixbuild.vital.company
        Port 2222
        PubkeyAcceptedKeyTypes ssh-ed25519
        ServerAliveInterval 60
        IPQoS throughput
        IdentityFile ${sshKeyPath}
        # The nixbuild endpoint runs hssh (nixbuild.net's Haskell SSH server),
        # not OpenSSH. On large transfers (e.g. `nix log`, big copy-back) a
        # client-initiated rekey collides with hssh still streaming CHANNEL_DATA,
        # and OpenSSH 10.x strict-KEX aborts: "non-transport message 94 received
        # from peer during key exchange" / Protocol error. Disable rekeying.
        RekeyLimit 128G none
    '';

    knownHosts = {
      nixbuild = {
        hostNames = [ "nixbuild.vital.company" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ+jBIzENqxs/p7dFEAIjG8e5TT+A9Gvhi1cKNdIJ9vW";
      };
    };
  };

  nix = {
    distributedBuilds = true;
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
    extraOptions = ''
      builders-use-substitutes = true
    '';
    settings = {
      max-jobs = lib.mkDefault "auto";
      trusted-users = [ "root" "@wheel" ];
    };
  };
}
