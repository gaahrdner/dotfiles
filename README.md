# dotfiles

[![Check](https://github.com/gaahrdner/dotfiles/actions/workflows/check.yml/badge.svg)](https://github.com/gaahrdner/dotfiles/actions/workflows/check.yml)

Nix-managed system configuration for my macOS machines, using [nix-darwin](https://github.com/nix-darwin/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager).

## Machines

| Name | Profile | Description |
|------|---------|-------------|
| `swordfish` | work | Work machine |
| `maxbeep` | personal | Personal machine |

## Usage

```bash
just rebuild            # apply work config (swordfish)
just rebuild-personal   # apply personal config (maxbeep)
just update             # update all flake inputs
just check              # validate flake
just fmt                # format nix files
just diff               # preview changes before applying
```

Run `just` to see all available commands.
