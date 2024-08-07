{ config, pkgs, lib, ... }:

let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in
{
  home.packages = with pkgs; ([
    # Common packages
    bat # https://github.com/sharkdp/bat
    bottom # https://github.com/ClementTsang/bottom
    cargo # https://github.com/rust-lang/cargo
    fzf
    gitAndTools.hub
    htop
    just
    nerdfonts
    ripgrep
    tree
    wget
  ] ++ lib.optionals isLinux [
    # Linux packages
    dbus 
    usbutils
  ] ++ lib.optionals isDarwin [
    # macOS packages
    pinentry_mac
  ]);
}
