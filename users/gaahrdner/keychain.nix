{ config, pkgs, ... }:

{
  programs.keychain = {
    enable = true;
    inheritType = "any";
    agents = [
      "ssh"
      "gpg"
    ];
    keys = [
      "id_ed25519"
    ];
  };
}
