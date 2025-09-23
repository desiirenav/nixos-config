{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./../../overlays/liga.nix
    ./../../modules/nixos/users/narayan.nix
    ./../../modules/nixos/system/boot.nix 
    ./../../modules/nixos/system/disko.nix
    ./../../modules/nixos/system/hardware-configuration.nix
    ./../../modules/nixos/system/impermanence.nix
    ./../../modules/nixos/system/services.nix
    ./../../modules/nixos/common/distrobox.nix
    ./../../modules/nixos/common/fonts.nix
    ./../../modules/nixos/common/gaming.nix
    ./../../modules/nixos/common/ios.nix
    ./../../modules/nixos/common/nvf.nix
    ./../../modules/nixos/common/packages.nix 
    ./../../modules/nixos/common/services.nix
    ./../../modules/nixos/common/stylix.nix
    ./../../modules/nixos/drivers/nvidia.nix
  ];

  # Time
  time.timeZone = "Canada/Eastern";

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "25.11"; # Did you read the comment?

}

