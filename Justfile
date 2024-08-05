# List available commands
default:
    @just --list

# Update flake inputs
update:
    nix flake update

# Check flake
check:
    nix flake check

# Build the home-manager configuration
build:
    home-manager build --flake .#gaahrdner@maxbeep

# Apply the home-manager configuration
apply:
    home-manager switch --flake .#gaahrdner@maxbeep

# Clean up old generations
clean:
    home-manager expire-generations "-30 days"

# Garbage collect
gc:
    nix-collect-garbage -d

# Show system information
system-info:
    nix-shell -p nix-info --run "nix-info -m"

# Enter a development shell
dev-shell:
    nix develop

# Update and apply in one command
update-and-apply: update apply

# List all generations
list-generations:
    home-manager generations

# Show the diff between the current generation and the new configuration
show-diff:
    home-manager build --flake .#gaahrdner@maxbeep
    nix store diff-closures /nix/var/nix/profiles/per-user/gaahrdner/home-manager $(home-manager build --flake .#gaahrdner@maxbeep | tail -n1)
