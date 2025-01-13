{ config, pkgs, lib, ...}:

let
  taps = [
    "cloudflare/cloudflare"
    "homebrew/bundle"
    "homebrew/services"
    "tursodatabase/tap"
  ];

  brews = [
    "exercism"
  ];

  casks = [
    "1password"
    "balenaetcher"
    "calibre"
    "discord"
    "docker"
    "elgato-stream-deck"
    "elgato-wave-link"
    "garmin-express"
    "ghidra"
    "godot"
    "google-chrome"
    "google-cloud-sdk"
    "google-drive"
    "iterm2"
    "keybase"
    "ledger-live"
    "mos"
    "obs"
    "obsidian"
    "ollama"
    "openscad"
    "orcaslicer"
    "qbittorrent"
    "qflipper"
    "rar"
    "raycast"
    "rectangle"
    "sanesidebuttons"
    "signal"
    "slack"
    "spotify"
    "steam"
    "syncthing"
    "tailscale"
    "vlc"
    "zoom"
    "zotero"
  ];
in
with lib;
{
  home.sessionPath = ["/opt/homebrew/bin"];

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
