# List available commands
default:
    @just --list

# Apply work configuration (swordfish)
rebuild:
    sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#swordfish

# Apply personal configuration (maxbeep)
rebuild-personal:
    sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#maxbeep

# Update all flake inputs
update:
    nix flake update

# Update a specific flake input
update-input input:
    nix flake update {{input}}

# Update inputs and rebuild
update-and-rebuild: update rebuild

# Check flake for errors
check:
    nix flake check

# Show what changed between current and new config
diff:
    nix store diff-closures /run/current-system $(nix build .#darwinConfigurations.swordfish.system --no-link --print-out-paths)

# Garbage collect old generations
gc:
    sudo nix-collect-garbage -d
    nix-collect-garbage -d

# Remove generations older than 30 days
gc-old:
    sudo nix-collect-garbage --delete-older-than 30d

# Show current flake inputs
inputs:
    nix flake metadata

# Show system info
info:
    nix-shell -p nix-info --run "nix-info -m"

# Enter a dev shell in current directory
dev:
    nix develop

# Format all nix files
fmt:
    nix fmt
