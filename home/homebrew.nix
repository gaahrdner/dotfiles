{ config, pkgs, lib, ... }:

let
  taps = [
    "cloudflare/cloudflare
    "homebrew/bundle"
    "homebrew/cask-drivers"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    "homebrew/cask"
    "homebrew/core
    "homebrew/services"
  ]

  brews = []

  casks = [
    "1password"
    "raycast"
    "steam"
    "signal"
    "spotify"
    "zoom"
    "visual-studio-code"
  ];
in
with lib;
{
  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.file.".Brewfile" = {
    text =
      (concatMapStrings (
        tap:
        ''tap "''
        + tap
        + ''
          "
        ''

      ) taps)
      + (concatMapStrings (
        brew:
        ''brew "''
        + brew
        + ''
          "
        ''

      ) brews)
      + (concatMapStrings (
        cask:
        ''cask "''
        + cask
        + ''
          "
        ''

      ) casks);
    onChange = ''
      /opt/homebrew/bin/brew bundle install --cleanup --no-upgrade --force --no-lock --global
    '';
  };
}