{ ... }: {
  environment.pathsToLink = [ "/share/zsh" ];
  environment.darwinConfig = "$HOME/src/github.com/stl314159/dotfiles/darwin";
#   environment.variables = {
#     EDITOR = "hx";
#     VISUAL = "hx";
#   };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh = {
    enable = true;
    # loginShellInit = ''
    #   # Start ssh-agent
    #   eval $(ssh-agent)
    # '';
  };
}