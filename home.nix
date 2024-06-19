{ config, pkgs, lib, ... }:

{
  home = {
    username = "gaahrdner";
    homeDirectory = "/Users/gaahrdner";
    stateVersion = "23.05";
    sessionVariables = {
      ERL_AFLAGS = "-kernel shell_history enabled";
    };
  };

  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  imports = map (x: ./home + x) [
    /macos.nix
    /packages.nix
    /homebrew.nix
  ];
}