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
      "aerospace"
      "alt-tab"
      "autodesk-fusion"
      "balenaetcher"
      "bambu-studio"
      "blackhole-2ch"
      "chatgpt"
      "cursor"
      "discord"
      "docker"
      "firefox"
      "ghidra"
      "github"
      "google-chrome"
      "imhex"
      "inkscape"
      "keka"
      "miniconda"
      "moonlight"
      "msty"
      "neo4j"
      "obsidian"
      "ollama"
      "openlens"
      "openscad"
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
      "warp"
      "wave"
      "wireshark"
      "zoom"
    ];

    masApps = {
      "Tailscale" = 1475387142;
      "Microsoft Word" = 462054704;
      "Microsoft Excel" = 462058435;
      "Microsoft PowerPoint" = 462062816;
      "Jump Desktop" = 524141863;
      "Xcode" = 497799835;
      "WireGuard" = 1451685025;
    };
  };
}
