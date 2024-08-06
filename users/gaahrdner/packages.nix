{ config, pkgs, lib, ... }:

let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in
{
  home.packages = with pkgs; ([
    # Common packages
    hello
    just
  ] ++ lib.optionals isLinux [
    # Linux packages
  ]

  ++ lib.optionals isDarwin [
    # macOS packages
  ]);
}
