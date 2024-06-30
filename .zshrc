# Utils
git_prompt() {
  local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"
  local branch_truncated="${branch:0:15}"

  if (( ${#branch} > ${#branch_truncated} )); then
    branch="${branch_truncated}_"
  fi
  [ -n "${branch}" ] && echo "%{\x1b[38;2;192;202;245m%}::%{\x1b[0m%}%{\x1b[38;2;158;206;106m%}${branch}%{\x1b[0m%}"
}

# Prompt
setopt PROMPT_SUBST
export PS1=$'%{\x1b[38;2;247;118;142m%}%c%{\x1b[0m%}$(git_prompt) %{\x1b[38;2;125;207;255m%}\U2192%{\x1b[0m%} '

# Path
export PATH="$PATH:/usr/local/gcc_arm/arm-gnu-toolchain-12.2.mpacbti-rel1-darwin-x86_64-arm-none-eabi/bin"

# Aliases
alias vi="nvim"
alias so="source $HOME/.zshrc" 
alias dots="cd $HOME/dotfiles/"
alias h="cd $HOME"
alias b="cd .."
alias python="python3"
alias pip="pip3"
alias erd="erd --level 1 --hidden --no-ignore --long --group"
