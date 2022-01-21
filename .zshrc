# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=long
zstyle ':completion:*' prompt 'Possible corrections:'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':compinstall' filename '$HOME/.zshrc'

# https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-3002667
autoload -Uz compinit
for dump in "$HOME/.zcompdump(N.mh+24)"; do
  compinit
done
compinit -C
# End of lines added by compinstall

autoload -U +X bashcompinit && bashcompinit

# Make sure meta-delete is bash-style
autoload -U select-word-style
select-word-style bash

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob histignorespace
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install

setopt share_history

# Aliases
alias e="nvim"
alias p="gopass"
alias ls="LC_COLLATE=C ls --color=auto --group-directories-first"
alias ll="ls -l"
alias la="ll -a"
alias tar-gz="tar -xvzf"
alias zsh-plug-install="antibody bundle < $HOME/.zsh_plugins > $HOME/.zsh_plugins.sh"

alias tg="terragrunt"
alias tgi="tg init"
alias tgp="tg plan"
alias tga="tg apply"
alias tgai="tg run-all init"
alias tgap="tg run-all plan"
alias tgaa="tg run-all apply"

# Plugins
source "$HOME/.zsh_plugins.sh"

# Vault
#complete -o nospace -C /home/draoncc/bin/vault vault

# Keybindings
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-kill-word

# Allow running commands without exiting interactive mode upon execution completion
if [[ $1 == eval ]]; then
  "$@"
  set --
fi
