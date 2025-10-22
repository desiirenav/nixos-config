{
  config,
  pkgs,
  inputs,
  ...
}: {

  imports = [ inputs.aagl.nixosModules.default ];

  environment.systemPackages = with pkgs; [
    mangohud
    qbittorrent
  ];

  environment.persistence."/persist/system" = {
    users.narayan = {
      directories = [
        "Games"
        ".local/share/Steam"
        ".local/share/anime-game-launcher"
        ".local/share/sleepy-launcher"
      ];
    };
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [proton-ge-bin];
  };

  nix.settings = inputs.aagl.nixConfig;

  programs.anime-game-launcher.enable = true;
  programs.sleepy-launcher.enable = true;
  #programs.honkers-railway-launcher.enable = true;
  programs.gamemode.enable = true;

}
