{ ... }: {
  networking.hostName = "swordfish";

  homebrew.taps = [ "schpet/tap" ];
  homebrew.brews = [
    "schpet/tap/linear"
    "ollama"
  ];
  homebrew.casks = [
    "claude"
    "claude-code@latest"
    "linear-linear"
    "notion"
  ];
}
