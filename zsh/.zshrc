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
