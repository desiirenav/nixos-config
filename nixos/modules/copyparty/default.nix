{ pkgs,inputs, ... }: {
  imports = [inputs.copyparty.nixosModules.default];

  nixpkgs.overlays = [ inputs.copyparty.overlays.default ];

  environment.systemPackages = [ pkgs.copyparty ];

  services.copyparty = {
    enable = true;
    group = "users";
    accounts = {
      narayan = {
        passwordFile = "/persist/passwords/password";
      };
    };
    groups = {
      g1 = ["narayan"];
    };
    volumes = {
      "/" = {
        path = "/srv/copyparty";
        access = {
          r = "*";
          rw = [ "narayan" ];
        };
        flags = {
          fk = 4;
          scan = 60;
          e2d = true;
          d2t = true;
          nohash = "\.iso$";
        };
      };
    };
    openFilesLimit = 8192;
  };
}
