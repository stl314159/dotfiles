{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.home-manager
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/src/github.com/stl314159/dotfiles/darwin";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [ "nix-command" "flakes" ];
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    #gnupg.agent.enable = true;
    zsh.enable = true;  # default shell on catalina
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  fonts.packages = [
    #pkgs.atkinson-hyperlegible
    #pkgs.jetbrains-mono
  ];

  services = {
  };

  homebrew = {
    enable = true;

    casks = [
      "1password"
      "obsidian"
      "raycast"
    ];

    masApps = {
      #"Drafts" = 1435957248;
      #"Reeder" = 1529448980;
      #"Things" = 904280696;
      #"Timery" = 1425368544;
    };
  };

  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
        show-process-indicators = false;
        show-recents = false;
        static-only = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
      };
      NSGlobalDomain = {
        AppleKeyboardUIMode = 3;
        "com.apple.keyboard.fnState" = true;
        NSAutomaticWindowAnimationsEnabled = false;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
