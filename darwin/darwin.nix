{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.home-manager
      pkgs.oh-my-zsh
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

  # Use an activation script to apply the defaults command
  system.activationScripts.symbolicHotkeys = {
    text = ''
      # Disable Cmd + Space for Spotlight
      defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '{
        enabled = 0;
        value = {
          parameters = (49, 1048576, 131072);
        type = "standard";
      };
    }'
    # Restart Dock to apply the changes
    killall Dock || true
    '';
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;
  #programs.zsh.oh-my-zsh = {
  #  enable = true;
  #  plugins = [ "git" "python" "man" ];
  #  theme = "agnoster";
  #  customPkgs = [ pkgs.nix-zsh-completions ];
  #};

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
      "fluxcd/tap"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "age"
      "awscli"
      "bat"
      "binwalk"
      "cmake"
      "cocoapods"
      "eza"
      "ffmpeg"
      "flux"
      "fzf"
      "gh"
      "jq"
      "k9s"
      "kubectx"
      "neovim"
      "nmap"
      "omnictl"
      "sops"
      "sshs"
      "starship"
      "talhelper"
      "talosctl"
      "tldr"
      "tmux"
      "wget"
      "xz"
      "yq"
      "yt-dlp"
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
      "Microsoft Word" = 462054704;
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
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
        mru-spaces = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "clmv";
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      NSGlobalDomain = {
        AppleKeyboardUIMode = 3;
        "com.apple.keyboard.fnState" = false;
        NSAutomaticWindowAnimationsEnabled = false;
        AppleInterfaceStyle = "Dark";
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
      };
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StandardHideDesktopIcons = true;
      };
      alf = {
        globalstate = 3;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
