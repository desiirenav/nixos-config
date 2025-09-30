# ~/.config/nixpkgs/vim.nix
{ pkgs }:
pkgs.vimUtils.buildVimPlugin {
  pname = "nvim-r";
  version = "c53b5a4";
  src = pkgs.fetchFromGitHub {
    owner = "jalvesaq";
    repo  = "nvim-r";
    rev   = "c53b5a402a26df5952718f483c7461af5bb459eb";
    sha256 = "13xbb05gnpgmyaww6029saplzjq7cq2dxzlxylcynxhhyibz5ibv";
  };
  # Only needed because we build from source:
  buildInputs = with pkgs; [ which vim zip ];
}

