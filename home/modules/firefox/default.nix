{
  programs.firefox = {
    enable = true;

    profiles = {
      my-profile = {
        # bookmarks, extensions, search engines...
      };
    };
  };

  stylix.targets.firefox.profileNames = [ "my-profile" ];
}

