export ZSH="$HOME/.oh-my-zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="kennethreitz"

# update automatically without asking
zstyle ':omz:update' mode auto

plugins=(git)

source $ZSH/oh-my-zsh.sh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

. /usr/share/z/z.sh

# pwn stuff
export PYTHONPATH="$PYTHONPATH:/$HOME/todo/uni/sols/6447-sols/lib"

# hugo stuff (well technically it's ruby)
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GEM_HOME/bin"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

export EDITOR='nvim'
