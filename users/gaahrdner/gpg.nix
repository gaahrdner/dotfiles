{ config, pkgs, lib, ... }:

let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
in
{
  programs.gpg = {
    enable = true;
    settings = {
      use-agent = true;
    };
  };

  home.file.".gnupg/gpg-agent.conf".text = lib.mkIf isDarwin ''
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '';

  services.gpg-agent = lib.mkIf isLinux {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "curses";
  };

  programs.zsh.initExtra = lib.mkIf isDarwin ''
    export GPG_TTY=$(tty)
    gpgconf --launch gpg-agent
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  programs.bash.initExtra = lib.mkIf isDarwin ''
    export GPG_TTY=$(tty)
    gpgconf --launch gpg-agent
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';
}
