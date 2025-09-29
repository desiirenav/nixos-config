{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./modules/default.nix
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

