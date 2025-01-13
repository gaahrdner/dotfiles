{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      
      # Configure Node.js module
      nodejs = {
        format = "via [$symbol($version )]($style)";
        detect_files = [ "package.json" ".node-version" ];
        detect_folders = [ "node_modules" ];
      };

      # Optional: Add NPM module
      package = {
        format = "via [$symbol($version )]($style)";
        symbol = "📦 ";
        display_private = true;
      };
    };
  };
}
