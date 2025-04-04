{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;
    };
  };
}
