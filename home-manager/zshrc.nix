{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      export SOPS_AGE_KEY='op://Private/AGE Key/password'
      alias sops='/opt/homebrew/bin/op run -- /opt/homebrew/bin/sops'
    '';
  };
}