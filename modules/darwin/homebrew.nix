{ ... }: {
    homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
      upgrade = true;
    };

    global.brewfile = true;

    taps = [
      "homebrew/services"
      "siderolabs/tap"
      "fluxcd/tap"
      "nikitabobko/tap"
    ];

    # `brew install`
    brews = [
      "age"
      "awscli"
      "azure-cli"
      "bat"
      "binwalk"
      "cmake"
      "cocoapods"
      "eza"
      "ffmpeg"
      "flux"
      "fzf"
      "gh"
      "git-lfs"
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
      "terraform"
      "tldr"
      "tmux"
      "tree"
      "uv"
      "virtualenvwrapper"
      "wget"
      "xz"
      "yq"
      "yt-dlp"
    ];

    casks = [
      "1password"
      "1password-cli"
      "aerospace"
      "android-platform-tools"
      "alt-tab"
      "autodesk-fusion"
      "balenaetcher"
      "bambu-studio"
      "blackhole-2ch"
      "chatgpt"
      "cursor"
      "discord"
      "firefox"
      "ghidra"
      "ghostty"
      "github"
      "google-chrome"
      "imhex"
      "inkscape"
      "keka"
      "lm-studio"
      "miniconda"
      "moonlight"
      "msty"
      "neo4j"
      "obsidian"
      "ollama"
      "openlens"
      "openscad"
      "openvpn-connect"
      "orbstack"
      "orcaslicer"
      "postman"
      "pgadmin4"
      "shottr"
      "signal"
      "slack"
      "steam"
      "raspberry-pi-imager"
      "raycast"
      "temurin"
      "visual-studio-code"
      "vlc"
      "wireshark"
      "zoom"
    ];

    masApps = {
      "Jump Desktop" = 524141863;
      "Microsoft Word" = 462054704;
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
      "Obsidian Web Clipper" = 6720708363;
      "Tailscale" = 1475387142;
      "WireGuard" = 1451685025;
      "Xcode" = 497799835;
    };
  };
}
