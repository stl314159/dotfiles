{ ... }: {
    homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    global.brewfile = true;

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
      "google-chrome"
      "keka"
      "miniconda"
      "moonlight"
      "neo4j"
      "obsidian"
      "ollama"
      "openlens"
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
      "Jump Desktop" = 524141863;
    };
  };
}