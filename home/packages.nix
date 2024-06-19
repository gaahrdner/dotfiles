{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.ckages = with pkgs; [
    act
    awscli
    azure-cli
    bettercap
    coreutils
    gnupg
    hashcat
    httpie
    jq
    ripgrep
    tree
    unzip
    wget
    yt-dlp
  ]
}