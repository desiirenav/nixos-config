{ inputs, config, lib, pkgs, ... }:

{

  environment.persistence."/persist/system" = { 
    users.narayan = {
      directories = [
        ".mozilla"
      ];
    };
  };

  programs.firefox = {
    enable = true;
  };
}

