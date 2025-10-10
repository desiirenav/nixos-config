{
  config,
  inputs,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      if [ (tty) = "/dev/tty1" ]
        exec niri-session
      end

      if test (tty) = "/dev/tty1"
        exec niri-session
      end
    '';
  };
}

