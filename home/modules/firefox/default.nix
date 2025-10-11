{ pkgs, inputs, ... }:

{

  imports = [ inputs.textfox.homeManagerModules.default ];

  programs.textfox = {
    enable = true;
    profile = "narayan";
    config = {
      displayHorizontalTabs = true;
      displayWindowControls = true;
      displayNavButtons = true;
      displayUrlbarIcons = true;
      displaySidebarTools = false;
      displayTitles = false;
    };
  };

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

