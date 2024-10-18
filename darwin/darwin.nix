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
  #programs = {
  #  #gnupg.agent.enable = true;
  #  zsh.enable = true;  # default shell on catalina
  #};
  programs.zsh.enable = true;

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

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "homebrew/services"
      "siderolabs/tap"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "awscli"
      "bat"
      "binwalk"
      "cmake"
      "cocoapods"
      "eza"
      "ffmpeg"
      "fluxcd/tap/flux"
      "fzf"
      "gh"
      "jq"
      "k9s"
      "kubectx"
      "nmap"
      "omnictl"
      "sshs"
      "starship"
      "talosctl"
      "tldr"
      "tmux"
      "wget"
      "xz"
      "yq"
    ];

    casks = [
      "1password"
      "1password-cli"
      "alt-tab"
      "balenaetcher"
      "cursor"
      "discord"
      "docker"
      "firefox"
      "ghidra"
      "github"
      "keka"
      "miniconda"
      "moonlight"
      "neo4j"
      "obsidian"
      "ollama"
      "openscad"
      "postman"
      "pgadmin4"
      "signal"
      "slack"
      "raspberry-pi-imager"
      "raycast"
      "temurin"
      "visual-studio-code"
      "vlc"
      "warp"
      "wave"
      "wireshark"
    ];

    masApps = {
      "Tailscale" = 1475387142;
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
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
