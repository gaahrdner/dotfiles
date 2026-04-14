{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      ls  = "eza";
      ll  = "eza -la";
      cat = "bat";
      cd  = "z";
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
