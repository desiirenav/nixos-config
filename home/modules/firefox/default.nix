# home.nix 
                                                                                           
{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.narayan = {
      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
      ];
    };
  };
}

