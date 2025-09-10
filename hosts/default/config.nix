{ inputs, config, lib, pkgs, ... }:

{
  #nixpkgs.overlays = [
  #  inputs.niri.overlays.niri
  #  inputs.nvim-config.overlays.default
  #];
 
  imports = [
    ./../../modules/nixos/hardware-configuration.nix
    ./../../modules/nixos/disko.nix
    ./../../modules/nixos/stylix.nix
    ./../../modules/nixos/impermanence.nix
    ./../../modules/nixos/nvidia.nix
    ./../../modules/nixos/gaming.nix
    ./../../modules/nixos/fonts.nix
    #./../../overlays/liga.nix
  ];

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

  # Fish shell
  #programs.fish.enable = true;

  # Default editor
  environment.variables.EDITOR = "nvim";

  # GDM
  #services.displayManager.gdm.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

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
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMHPbw+pDwlAKwYlnQGoIdns5E8n7RhVxfhu2QsL36aM narayan@nixos"];
    };
  };

  # Home-manager
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "narayan" = import ./home.nix;
    };
  };

  # Niri
  #niri-flake.cache.enable = false;
  #programs.niri = {
  #  enable = true;
  #  package = pkgs.niri-unstable;
  #};

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # GVFS
  services.gvfs.enable = true;

  # upower
  services.upower.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.system}".default
    yazi
    ani-cli
    unzip
    fastfetch
    nvim-pkg
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

