{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      # navigation
      ls   = "eza";
      ll   = "eza -la";
      cat  = "bat";
      cd   = "z";

      # git
      g    = "git";
      ga   = "git add";
      gaa  = "git add --all";
      gc   = "git commit";
      gcm  = "git commit -m";
      gcam = "git commit -am";
      gcl  = "git clone";
      gco  = "git checkout";
      gcb  = "git checkout -b";
      gd   = "git diff";
      gds  = "git diff --staged";
      gl   = "git pull";
      gp   = "git push";
      gpf  = "git push --force-with-lease";
      gst  = "git status";
      glog = "git log --oneline --graph --decorate";
      grb  = "git rebase";
      gra  = "git rebase --abort";
      grc  = "git rebase --continue";
      gsh  = "git stash";
      gstp = "git stash pop";

      # nix
      rebuild   = "sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/Code/dotfiles#swordfish";
      rebuild-p = "sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/Code/dotfiles#maxbeep";
      update    = "nix flake update ~/Code/dotfiles";
    };

    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(mise activate zsh)"

      # granted assume alias (required for shell env export to work)
      alias assume="source ${pkgs.granted}/bin/assume"
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
