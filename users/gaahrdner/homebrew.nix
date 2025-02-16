{ config, pkgs, lib, ...}:

let
  taps = [
    "cloudflare/cloudflare"
    "homebrew/bundle"
    "homebrew/services"
    "libsql/sqld"
    "threedotslabs/tap"
    "tursodatabase/tap"
  ];

  brews = [];

  casks = [
    "1password"
    "android-platform-tools"
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
