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
  services.displayManager.gdm.enable = true;
  #services.desktopManager.gnome.enable = true;
 
  # User
  users.mutableUsers = false;
  users.users = {
    root.hashedPasswordFile = "/persist/passwords/root";
    narayan = {
      isNormalUser = true;
      description = "Narayan";
      extraGroups = [ "wheel" "networkmanager"];
      hashedPasswordFile = "/persist/passwords/narayan";
      shell = pkgs.nushell;
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILkP3cPc6L2zpp9uPILiDZAjF8dwPx1jm58V/cMBP+KL narayan@nixos"];
    };
  };

  programs.fuse.userAllowOther = true;

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

