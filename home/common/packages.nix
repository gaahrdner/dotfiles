{ pkgs, agenix, ... }: {
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

    # new hotness
    yazi
    granted
    devenv
    agenix.packages.${pkgs.system}.default
  ];
}
