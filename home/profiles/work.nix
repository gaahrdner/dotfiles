{ pkgs, ... }: {
  imports = [ ../common ];

  home.username = "pgardner";
  home.homeDirectory = "/Users/pgardner";
  home.stateVersion = "25.11";

  programs.git.settings = {
    user.name = "Phil Gardner";
    user.email = "phil@work.com";
  };

  home.packages = with pkgs; [
    # work specific tools, add as needed
  ];
}
