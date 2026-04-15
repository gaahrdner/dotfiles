{ pkgs, agenix, ... }: {
  imports = [ ../common ];

  home.username = "pgardner";
  home.homeDirectory = "/Users/pgardner";
  home.stateVersion = "25.11";

  programs.git.settings = {
    user.name = "Phil Gardner";
    user.email = "phil@work.com";
    user.signingKey = "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFUT8VaovrPh4ssAV3SQqRhqKfrTEeBcS2+c2rgzPRu7";
  };

  home.file.".ssh/allowed_signers".text = ''
    phil@work.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFUT8VaovrPh4ssAV3SQqRhqKfrTEeBcS2+c2rgzPRu7
  '';

  programs.zsh.initContent = ''
    # granted - tell it the alias is already configured so it doesn't
    # try to write to .zshenv (which is Nix-managed and read-only)
    export GRANTED_ALIAS_CONFIGURED=true
    alias assume="source ${pkgs.granted}/bin/assume"
  '';

  home.packages = with pkgs; [
    yazi
    granted
    agenix.packages.${pkgs.system}.default
    terraform
    terragrunt
    aws-sso-cli
    awscli2
  ];
}
