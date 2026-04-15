# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Nix-based dotfiles for managing macOS (Darwin) system and user configuration across two machines:
- **swordfish** — work machine (aarch64-darwin)
- **maxbeep** — personal machine (aarch64-darwin)

Uses **nix-darwin** for system-level config and **home-manager** for user-level config. Secrets managed with **agenix**.

## Common Commands

```bash
just rebuild              # Apply work config (swordfish)
just rebuild-personal     # Apply personal config (maxbeep)
just update               # Update all flake inputs
just update-input <name>  # Update a specific flake input
just update-and-rebuild   # Update then rebuild
just check                # Validate flake configuration
just diff                 # Preview changes before applying
just gc                   # Garbage collect all old generations
just gc-old               # Remove generations older than 30 days
just fmt                  # Format all Nix files
```

## Architecture

```
flake.nix               # Entry point — defines two darwinConfigurations
darwin/                 # nix-darwin modules (system-level, runs as root)
  common.nix            # Shared: Homebrew casks, macOS defaults, sudo TouchID
  work.nix              # swordfish-specific overrides
  personal.nix          # maxbeep-specific overrides
home/                   # home-manager modules (user-level, runs as pgardner)
  common/               # Shared across both profiles
    default.nix         # Imports all common modules
    packages.nix        # CLI tools (ripgrep, bat, eza, yazi, granted, etc.)
    shell.nix           # Zsh, Starship, Atuin, Zoxide, aliases
    git.nix             # Git config with SSH signing via 1Password
    ssh.nix             # SSH config using 1Password agent
  profiles/
    work.nix            # Work identity + terraform/terragrunt/awscli
    personal.nix        # Personal identity, minimal extras
```

**Layer separation**: `darwin/` modules configure the system (homebrew, macOS defaults, enabled shells). `home/` modules configure the user environment (packages, shell config, dotfiles). They are composed together in `flake.nix` via a `mkDarwinSystem` helper.

## Key Design Decisions

- **Aliases in shell.nix, not .zshenv**: The `granted` AWS credential tool tries to write to `.zshenv`, which is Nix-managed and immutable. The workaround exports the alias directly in `shell.nix` and sets `GRANTED_ALIAS_CONFIGURED=1` to suppress the write.
- **SSH commit signing**: Git uses SSH keys via 1Password agent for signing — no GPG.
- **mise for runtime versions**: Language/runtime version management is via `mise` (not nix-managed runtimes), initialized in shell.nix.
- **nixpkgs-unstable**: Both profiles track unstable nixpkgs for latest packages.
