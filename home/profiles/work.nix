{ pkgs, ... }: {
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

  home.packages = with pkgs; [
    terraform
    terragrunt
    aws-sso-cli
    awscli2
  ];
}
