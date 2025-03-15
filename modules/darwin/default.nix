{ pkgs, inputs, user, ... }: {
  imports = [ ./config.nix ./zsh.nix ./homebrew.nix ./raycast.nix ];

  users.users.${user.name} = user;


  # NOTE: This removes any manually-added fonts
#   fonts.packages = with pkgs; [ fira-code fira-code-nerdfont ];

  # --- Nix config --- #

  # Auto upgrade nix package and the daemon service.
  #services.nix-daemon.enable = true;
  # Disable nix-darwin’s Nix management to allow Determinate to manage it.
  nix.enable = false;

  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Fix `error: file 'nixpkgs' was not found in the Nix search path`
  nix.settings.extra-nix-path = "nixpkgs=flake:nixpkgs";

  # Set Git commit hash for darwin-version.
  system.configurationRevision =
    inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  environment.systemPackages = with pkgs; [
    devenv
    # ... any other packages you want installed
  ];

  nix = {
    # Append extra options that will be written to /etc/nix/nix.conf.
    extraOptions = ''
      extra-substituters = https://devenv.cachix.org
      extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
      trusted-users = root scott
    '';
  };
  
}