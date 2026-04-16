{ pkgs, ... }: {
  home.packages = with pkgs; [
    # core tools
    mise
    _1password-cli
    ripgrep
    fd
    bat
    eza
    just
    jq
    wget
    curl
    tree
    gh
  ];
}
