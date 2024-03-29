DATA=$HOME/.data
CONFIG=$HOME/.config

# zsh
export ZSH="$CONFIG/zsh/omz"
export ZSH_COMPDUMP=$DATA/zsh/zcompdump-$HOST
export HISTFILE=$DATA/zsh/history
zstyle ':omz:update' mode auto # update automatically
ZSH_THEME="kennethreitz"
plugins=(git)
source $ZSH/oh-my-zsh.sh

[ -f $CONFIG/zsh/aliases ] && source $CONFIG/zsh/aliases 

# z.sh
. /usr/share/z/z.sh
# export _Z_DATA=$DATA/z/z

# pwn stuff
export PYTHONPATH="$PYTHONPATH:/$HOME/todo/uni/sols/6447-sols/lib"

# hugo stuff (well technically it's ruby)
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GEM_HOME/bin"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

export GOPATH="$HOME/.go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

export EDITOR='nvim'
