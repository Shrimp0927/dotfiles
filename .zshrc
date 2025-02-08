# Utils
git_prompt() {
  local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"
  local branch_truncated="${branch:0:15}"

  if (( ${#branch} > ${#branch_truncated} )); then
    branch="${branch_truncated}_"
  fi
  [ -n "${branch}" ] && echo "%{\x1b[38;2;255;234;201m%}::%{\x1b[0m%}%{\x1b[38;2;15;195;255m%}${branch}%{\x1b[0m%}"
}

# Prompt
setopt PROMPT_SUBST
export PS1=$'%{\x1b[38;2;119;119;119m%}%c%{\x1b[0m%}$(git_prompt) %{\x1b[38;2;255;255;54m%}->%{\x1b[0m%} '

# Aliases
alias vi="nvim"
alias so="source $HOME/.zshrc" 
alias dots="cd $HOME/dotfiles/"
alias h="cd $HOME"
alias b="cd .."
alias erd="erd --level 1 --hidden --no-ignore --long --group"
alias c="clear"

# Startup
#exec fortune | cowsay
