{ ... }: {
  # Dock settings
  system.defaults.dock.autohide = true;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.orientation = "bottom";
  system.defaults.dock.show-process-indicators = false;
  system.defaults.dock.static-only = true;
  system.defaults.dock.mru-spaces = false;
  
  # Finder settings
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.FXDefaultSearchScope = "SCcf";
  system.defaults.finder.FXPreferredViewStyle = "clmv";
  system.defaults.finder.FXEnableExtensionChangeWarning = false;
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowStatusBar = true;

  # Set up keyboard
  system.defaults.NSGlobalDomain.AppleKeyboardUIMode = 3;
  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
  system.defaults.NSGlobalDomain."com.apple.keyboard.fnState" = false;
  system.defaults.NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
  system.defaults.NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;

  # Window manager settings
  system.defaults.WindowManager.EnableStandardClickToShowDesktop = false;
  system.defaults.WindowManager.StandardHideDesktopIcons = true;

  # Enable sudo authentication with Touch ID
  security.pam.enableSudoTouchIdAuth = true;

  system.activationScripts.extraActivation.enable = true;
  system.activationScripts.extraActivation.text = ''
    echo "Activating extra preferences..."
    # Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
    osascript -e 'tell application "System Preferences" to quit'
  '';

  system.activationScripts.postUserActivation.text = ''
    # Following line allows us to avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
}