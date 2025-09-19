{inputs, lib, pkgs, ...}: {

  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  home.persistence."/persist/home" = {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Games"
      "Projects"
      ".ssh"
      ".zen"
      ".config/ignis"
      #".config/heroic"
      ".local/share/Steam"
      ".local/share/anime-game-launcher"
      #".local/share/sleepy-launcher"
      ".config/discord"
      ".config/Vencord"
    ];
    files = [
      ".bash_history"
      ".config/systemsettingsrc"
    ];
    allowOther = true;
  };
}
