{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hjem.nixosModules.default
  ];

  hjem = {
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
    users = {
      narayan = {
        enable = true;
      };
    };
  };
}
