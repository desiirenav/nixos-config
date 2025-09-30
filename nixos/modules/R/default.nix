{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let 
  R-with-my-packages = rWrapper.override{ packages = with rPackages; [ knitr rmarkdown ]; };
in {
  environment.systemPackages = with pkgs; [
    R-with-my-packages
  ];
}
