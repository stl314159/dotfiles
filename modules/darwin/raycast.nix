{ pkgs, user, ... }: {
  environment.systemPackages = with pkgs; [ raycast ];

  system.defaults.CustomUserPreferences = {
    "com.raycast.macos" = {
      raycastGlobalHotkey = "Command-49";
      raycastShouldFollowSystemAppearance = 1;
    };
  };

  system.activationScripts.extraActivation.text = ''
    # Let Raycast have cmd+space instead of Spotlight
    /usr/libexec/PlistBuddy ${user.home}/Library/Preferences/com.apple.symbolichotkeys.plist \
      -c "Delete :AppleSymbolicHotKeys:64" \
      -c "Add :AppleSymbolicHotKeys:64:enabled bool false" \
      -c "Add :AppleSymbolicHotKeys:64:value:parameters array" \
      -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 65535" \
      -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 49" \
      -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 1048576" \
      -c "Add :AppleSymbolicHotKeys:64:type string standard"

    # Unmap "Show Finder search"
    /usr/libexec/PlistBuddy ${user.home}/Library/Preferences/com.apple.symbolichotkeys.plist \
      -c "Delete :AppleSymbolicHotKeys:65" \
      -c "Add :AppleSymbolicHotKeys:65:enabled bool false" \
      -c "Add :AppleSymbolicHotKeys:65:value:parameters array" \
      -c "Add :AppleSymbolicHotKeys:65:value:parameters: integer 65535" \
      -c "Add :AppleSymbolicHotKeys:65:value:parameters: integer 49" \
      -c "Add :AppleSymbolicHotKeys:65:value:parameters: integer 1572864" \
      -c "Add :AppleSymbolicHotKeys:65:type string standard"
  '';
}