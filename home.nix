{ config, pkgs, lib, ... }:

{
  imports = [
    ./users/gaahrdner
  ];

  home.stateVersion = "24.05"; # Don't change this, won't upgrade home-manager
  programs.home-manager.enable = true;
}
