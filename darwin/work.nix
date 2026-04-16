{ ... }: {
  networking.hostName = "swordfish";

  homebrew.taps = [ "schpet/tap" ];
  homebrew.brews = [ "schpet/tap/linear" ];
  homebrew.casks = [
    "claude"
    "claude-code@latest"
    "codex"
    "linear-linear"
    "notion"
  ];
}
