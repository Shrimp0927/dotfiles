# Prompt
#PS1=$'%{\e[1;36m%}%n%{\e[0m%}::%c \U1F308 '
#PS1=$'%{\x1b[35m%}\U250C\U2500%{\x1b[0m%} %{\x1b[1;38;2;0;255;255m%}%c%{\x1b[0m%}:: \n%{\x1b[35m%}\U2514%{\x1b[0m%} %{\x1b[1;31m%}\U1F58A%{\x1b[0m%} '


# Custom Paths
NVM_PATH=$HOME/.nvm
RVM_PATH=$HOME/.rvm

# Init NVM 
[[ -d $NVM_PATH ]] && [[ -f $NVM_PATH/nvm.sh ]] && \. $NVM_PATH/nvm.sh

# Paths
export PATH="$HOME/.rvm/bin:$PATH:/Applications/Postgres.app/Contents/Versions/14/bin:/Applications/Alacritty.app/Contents/MacOS"

# Aliases
alias vi="nvim"
alias so="source $HOME/.zshrc" 
alias dots="cd $HOME/dotfiles/"
alias h="cd $HOME"
