{ config, lib,pkgs,inputs,system,...}: 

{

  services.displayManager.gdm.enable = true;
  services = {
    gvfs.enable = true;
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
