{
  config,
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    targets.neovim.enable = false;
  };
}

