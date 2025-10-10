{
  config,
  lib,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [ ./modules ];

  # Host name
  networking.hostName = "nixos";

  # Networking host ID
  networking.hostId = "b5bf67d7";

  # Network
  networking.networkmanager.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NTFS & ZFS
  boot.initrd.supportedFilesystems = [ "zfs" ];
  boot.supportedFilesystems = ["ntfs"];

  # Time
  time.timeZone = "Canada/Eastern";

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Gnome
  #services.displayManager.gdm.enable = true;
  #services.desktopManager.gnome.enable = true;

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Fish shell
  programs.fish.enable = true;

  # User
  users.mutableUsers = false;
  users.users = {
    root.hashedPasswordFile = "/persist/passwords/root";
    narayan = {
      isNormalUser = true;
      description = "Narayan";
      extraGroups = [ "wheel" "networkmanager"];
      shell = pkgs.fish;
      hashedPasswordFile = "/persist/passwords/narayan";
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAoyU9jZ1PpX6erE14WSCWYNEd41zju1pMCp6dZj+epu narayan@nixos"];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # GVFS
  services.gvfs.enable = true;

  # OpenSSH daemon.
  services.openssh.enable = true;

  # Autoclean
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "25.11"; # Did you read the comment?

}

