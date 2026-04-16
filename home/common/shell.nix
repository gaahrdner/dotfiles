{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    shellAliases = {
      # navigation
      ls      = "eza";
      ll      = "eza -la";
      cat     = "bat";
      cd      = "z";
      ".."    = "cd ..";
      "..."   = "cd ../..";
      "...."  = "cd ../../..";
      "....." = "cd ../../../..";

      # nix
      rebuild   = "sudo darwin-rebuild switch --flake ~/Code/dotfiles#swordfish";
      rebuild-p = "sudo darwin-rebuild switch --flake ~/Code/dotfiles#maxbeep";
      update    = "nix flake update ~/Code/dotfiles";
    };

    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(mise activate zsh)"
    '';
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      search_mode = "fuzzy";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
