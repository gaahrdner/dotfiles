{ config, pkgs, lib, ... }:

let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
  unsupported = builtins.abort "Unsupported platform";
in
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./direnv.nix
    ./homebrew.nix
    ./git.nix
    ./gpg.nix
    ./jq.nix
    ./keychain.nix
    ./packages.nix
    ./starship.nix
    ./vim.nix
    ./vscode.nix
    ./zsh.nix
  ];

  home.username = "gaahrdner";
  home.homeDirectory =
    if isLinux then "/home/gaahrdner" else
    if isDarwin then "/Users/gaahrdner" else unsupported;
}
