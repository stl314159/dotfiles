# Dotfiles

This is to describe the barebones development system I use. Supports NixOS on WSL, Intel and Silicon Macs.

Featuring:
- Tmux
- Neovim
- OSX
  - darwin-nix
  - homebrew mas

## Install Nix

On OSX: [Determinate Systems Installer](https://github.com/DeterminateSystems/nix-installer).
`curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install macos`
On WSL2: [WSL2 Nix](https://github.com/nix-community/NixOS-WSL?tab=readme-ov-file)

## Bootstrap

> [!WARNING]
> I haven't tested bootstrapping this yet, especially on an "unknown" host.

### NixOS (currently just WSL)

`sudo nixos-install --flake github:stl314159/dotfiles#nixos`

### Darwin/Linux

`nix run nix-darwin -- switch --flake github:stl314159/dotfiles`

## Update

### NixOS

`sudo nixos-rebuild switch --flake ~/src/github.com/stl314159/dotfiles`

### Darwin

`darwin-rebuild switch --flake ~/src/github.com/stl314159/dotfiles`

## Home Manager

You could use something like this to import my home-manager standalone.

```nix
{ config, pkgs, ... }: {
  home-manager.users.evan = import ./home-manager/home.nix;
}
```
