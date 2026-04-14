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
    };

    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(mise activate zsh)"
    '';
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
