{ inputs, config, lib, pkgs, ... }:

{
  # Host name
  networking.hostName = "nixos";

  # Networking host ID
  networking.hostId = "b5bf67d7";

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
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILkP3cPc6L2zpp9uPILiDZAjF8dwPx1jm58V/cMBP+KL narayan@nixos"];
    };
  };

  programs.fuse.userAllowOther = true;
}

