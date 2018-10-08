# options

bindkey -e


# history

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory
setopt sharehistory
setopt extendedhistory

# path

typeset -U path

path+=(
)


# exports

EDITOR="nvim"
CLICOLOR=1


# aliases

alias la="gls -A"
alias lt='gls -lhart'
alias ll="gls -lsvAt"
alias ls="gls --color=auto"
alias git="hub"

# prompt
setopt prompt_subst
autoload -U colors && colors
autoload -U promptinit; promptinit
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "on %{$fg[magenta]%}%b%{$reset_color%}%a%m%u%c"
zstyle ':vcs_info:*' stagedstr " %{$fg[green]%}●%{$reset_color%}"
zstyle ':vcs_info:*' unstagedstr " %{$fg[red]%}✚%{$reset_color%}"
precmd() {
  vcs_info
}

# highlights the timestamp on error
function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  local EXIT_CODE_PROMPT=' '
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    EXIT_CODE_PROMPT+="%{$fg[red]%}(%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}) %t%{$reset_color%}"
  else
    EXIT_CODE_PROMPT+="%{$fg[green]%}%t%{$reset_color%}"
  fi
  echo "$EXIT_CODE_PROMPT"
}

_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

PROMPT='%{$fg[blue]%}%2/%{$reset_color%} ${vcs_info_msg_0_}${_newline}❯ '
RPROMPT='%{${_lineup}%}$(check_last_exit_code)%{${_linedown}%}'

# enable autocompletion

autoload -U compinit; compinit
zstyle ':completion:*' menu select
setopt completealiases


# load plugins

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

FZF_DEFAULT_COMMAND="rg --no-ignore --hidden --files --follow -g '!{.git,node_modules,vendor}'"
FZF_CTRL_T_COMMAND="rg --no-ignore --hidden --files --follow -g '!{.git,node_modules,vendor}'"
FZF_ALT_C_COMMAND="bfs \( -path '*/vendor' -or -path '*/node_modules' \) -prune -or -type d -nohidden"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# fasd
if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="$HOME/.fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
  alias v='f -e vim'
  alias o='a -e open'
fi