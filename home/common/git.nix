{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      rerere.enabled = true;
    };
    ignores = [
      ".DS_Store"
      ".direnv"
      "*.local"
    ];
  };
}
