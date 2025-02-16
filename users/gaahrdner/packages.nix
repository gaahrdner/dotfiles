{ config, pkgs, lib, ... }:

let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in
{
  home.packages = with pkgs; ([
    # Common packages
    aider-chat
    bat # https://github.com/sharkdp/bat
    bottom # https://github.com/ClementTsang/bottom
    cargo # https://github.com/rust-lang/cargo
    code2prompt
    exercism
    fzf
    gh
    gitAndTools.hub
    htop
    mise
    just
    rar
    terraform
    turso-cli
  ] ++ 
  # Include all nerd fonts
  (builtins.filter lib.attrsets.isDerivation (builtins.attrValues nerd-fonts)) ++
  [
    ripgrep
    tree
    wget
    uv
    ruff
  ] ++ lib.optionals isLinux [
    # Linux packages
    dbus
    usbutils
  ] ++ lib.optionals isDarwin [
    # macOS packages
    pinentry_mac
  ]);
}
