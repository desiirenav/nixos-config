{
  inputs,
  pkgs,
  ...
}: {

  nixpkgs.overlays = [
    inputs.nvim-config.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    nvim-pkg
  ];
}
