{ pkgs, ... }: {
  home.packages = with pkgs; [
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
  ];
}
