{ inputs, config, lib, pkgs, ... }:

{
  # Display Manager
  services.displayManager.gdm.enable = true;

  # Gnome
  services.desktopManager.gnome.enable = true;

  # Gnome core apps
  #services.gnome.core-apps.enable = true;

  # GVFS
  services.gvfs.enable = true;

  # upower
  services.upower.enable = true;

  # OpenSSH daemon.
  services.openssh.enable = true;

}

