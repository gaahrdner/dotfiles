{ config, pkgs, lib, ... }:

let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
  unsupported = builtins.abort "Unsupported platform";
in
{
  imports = [
    ./vim.nix
    ./packages.nix
  ];

  home.username = "gaahrdner";
  home.homeDirectory =
    if isLinux then "/home/gaahrdner" else
    if isDarwin then "/Users/gaahrdner" else unsupported;
}
