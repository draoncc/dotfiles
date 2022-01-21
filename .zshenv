export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin"
export TERM="xterm-256color"
export EDITOR="nvim"
export PROMPT="%(?.%F{green}%?%f.%F{red}%?%f) %{%}%2c %B%F{blue}%(!.#.>)%f%b %{%}"

# yarn global installs
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$HOME/.deno/bin:$PATH"

source "/home/cino/.rover/env"
