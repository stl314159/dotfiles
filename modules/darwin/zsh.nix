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
    loginShellInit = ''
      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__conda_setup"
      else
          if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
              . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
          else
              export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
        fi
      fi
      unset __conda_setup
      # <<< conda initialize <<<
      export WORKON_HOME=$HOME/.virtualenvs
      export VIRTUALENVWRAPPER_PYTHON=$(which python3)
      source $(which virtualenvwrapper.sh)
      # Aider Path Setup
      export PATH="$HOME/.local/bin:$PATH"
      # Mise Setup
      eval "$(mise activate zsh)"
    '';
  };
}