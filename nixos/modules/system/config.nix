{ inputs, config, lib, pkgs, ... }:

{
  # Host name
  networking.hostName = "nixos";
  
  # Network
  networking.networkmanager.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NTFS
  boot.supportedFilesystems = ["ntfs"];

  # Time
  time.timeZone = "Canada/Eastern";

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Display Manager
  services.displayManager.gdm.enable = true;

  # Users
  users.mutableUsers = false;
  users.users = {
    root.hashedPasswordFile = "/persist/passwords/root";
    narayan = {
      isNormalUser = true;
      description = "Narayan";
      #shell = pkgs.fish;
      extraGroups = [ "wheel" "networkmanager"];
      hashedPasswordFile = "/persist/passwords/narayan";
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHdOTUkjWxw+z6qKlMb8L7H1jaaEtFHIy9cSWRdp9DiH narayan@nixos"];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # GVFS
  services.gvfs.enable = true;

  # upower
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    yazi
    vlc
    ani-cli
    unzip
    nitch
    fastfetch
    calibre
    fuzzel
    git
  ];

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

