{ ... }: {
  imports = [
    ./packages.nix
    ./shell.nix
    ./git.nix
    ./ssh.nix
    ./ghostty.nix
  ];
}
