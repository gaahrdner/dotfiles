{ pkgs, ... }: {
  system.stateVersion = 5;
  system.primaryUser = "pgardner";

  nix.enable = false;

  users.users.pgardner = {
    name = "pgardner";
    home = "/Users/pgardner";
  };

  homebrew = {
    enable = true;
    casks = [
      "1password"
      "ghostty"
      "raycast"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
  };

  system.defaults = {
    dock.autohide = true;
    dock.show-recents = false;
    NSGlobalDomain.ApplePressAndHoldEnabled = false;
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.InitialKeyRepeat = 15;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
  ];
}
