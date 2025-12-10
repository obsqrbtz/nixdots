autoload -U colors && colors
setopt PROMPT_SUBST

git_branch() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  echo "($branch)"
}

PROMPT='%F{cyan}➜ %f%F{yellow}%~%f $(git_branch) %F{magenta}»%f '

RPROMPT='%(?..%F{red}✖ %?%f)'

precmd() { : }  # empty precmd hook to refresh prompt if needed

