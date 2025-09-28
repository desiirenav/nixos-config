{inputs, pkgs, ...}: {
  imports = [inputs.ignis.homeManagerModules.default];
  programs.ignis = {
    enable = true;

    # Add Ignis to the Python environment (useful for LSP support)
    addToPythonEnv = true;

    services = {
      bluetooth.enable = true;
      recorder.enable = true;
      audio.enable = true;
      network.enable = true;
    };

    # Enable Sass support
    sass = {
      enable = true;
      useDartSass = true;
    };

    extraPackages = with pkgs; [
      hello
      python313Packages.jinja2
      python313Packages.materialyoucolor
      python313Packages.pillow
    ];
  };
}
