{
  pkgs,
  ...
}: with pkgs;
  let 
  R-with-my-packages = rWrapper.override{ packages = with rPackages; [ languageserver knitr rmarkdown readxl quarto car ]; };
in {
  environment.systemPackages = with pkgs; [
    R-with-my-packages
    pandoc
    texliveFull
    typst
  ];
}
