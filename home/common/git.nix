{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      rerere.enabled = true;
      gpg.format = "ssh";
      gpg.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      commit.gpgsign = true;
    };
    ignores = [
      ".DS_Store"
      ".direnv"
      "*.local"
    ];
  };
}
