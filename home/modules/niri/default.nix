{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri 
    inputs.niri.homeModules.stylix 
    ./settings.nix 
    ./binds.nix 
    ./rules.nix
  ];
}
