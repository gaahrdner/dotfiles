{ config, pkgs, lib, ... }:
let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
  unsupported = builtins.abort "Unsupported platform";
in
{
  imports = [
    # TODO: move statements into other files
  ];

  home.username = "gaahrdner";
  home.homeDirectory =
    if isLinux then "/home/gaahrdner" else
    if isDarwin then "/Users/gaahrdner" else unsupported;

  home.stateVersion = "24.05"; # Don't change this, won't upgrade home-manager
  programs.home-manager.enable = true;

  home.packages = with pkgs; ([
    # Common packages
    hello
  ] ++ lib.optionals isLinux [
    # Linux packages
  ]

  ++ lib.optionals isDarwin [
    # macOS packages
  ]);
}
