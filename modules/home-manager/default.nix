{ pkgs, lib, ... }:

{
  imports = [
    ./zsh.nix
    ./git.nix
    ./starship.nix
    ./tmux.nix
  ];

  home = {
    stateVersion = "24.05"; # Please read the comment before changing.

    sessionPath = [
      "$HOME/bin"
      "$HOME/scripts"
      "/opt/homebrew/bin"
    ];

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      ripgrep
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      #hammerspoon = lib.mkIf pkgs.stdenvNoCC.isDarwin {
      #  source = ./../.config/hammerspoon;
      #  target = ".hammerspoon";
      #  recursive = true;
      #};
    };

    sessionVariables = {
    };
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
