{ inputs, config, lib, pkgs, ... }:

{
 
  # Network
  networking.networkmanager.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ZFS
  boot.initrd.supportedFilesystems = [ "zfs" ];

  # NTFS
  boot.supportedFilesystems = ["ntfs" "zfs"];

  # Autoclean
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

}

