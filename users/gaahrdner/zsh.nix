{ config, pkgs, ... }:                                                           
                                                                                 
{                                                                                
  programs.zsh = {                                                               
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    
    # Initialize your shell environment
    initExtra = ''
      # Any custom commands you want to run when zsh starts
      export PATH="$PATH:$HOME/.npm-packages/bin"
      export NODE_PATH="$HOME/.npm-packages/lib/node_modules"
      
      # Initialize Starship
      eval "$(starship init zsh)"
      eval "$(mise activate zsh)"
    '';

    # Environment variables
    sessionVariables = {
      EDITOR = "vim";
      NPM_CONFIG_PREFIX = "$HOME/.npm-packages";
    };

    # Your shell aliases
    shellAliases = {
      ll = "ls -l";
      update = "home-manager switch";
    };

    # History settings
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    # Add useful plugins without the theme management
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "node" "npm" ];
      # Remove theme since we're using Starship
      theme = "";
    };
  };

  # Add Node.js and npm directly through Nix
  home.packages = with pkgs; [
    nodejs_22
    nodePackages.npm
  ];

  # Ensure XDG directories exist
  xdg.enable = true;
}
