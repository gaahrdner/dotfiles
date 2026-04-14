{ ... }: {
  networking.hostName = "swordfish";

  homebrew.casks = [
    "claude"
    "claude-code@latest"
    "codex"
  ];
}
