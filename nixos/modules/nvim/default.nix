{
  inputs,
  pkgs,
  ...
}: {

  nixpkgs.overlays = [
    inputs.nvim-config.overlays.default
    (final: prev: {
      vimPlugins = prev.vimPlugins // {
        base2Tone-nvim = prev.vimUtils.buildVimPlugin {
          name = "base2Tone-nvim";
          src = inputs.base2Tone-nvim;
        };
      };
    })
  ];

  environment.systemPackages = with pkgs; [
    nvim-pkg
  ];
}
