# Mostly copied from https://gist.github.com/chrisnolet/d3582cd63eb3d7b4fcb4d5975fd91d04
autoload -Uz compinit && compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats " %F{cyan}%c%u(%b)%f %a"
zstyle ':vcs_info:*' stagedstr "%F{green}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if git --no-optional-locks status --porcelain 2> /dev/null | grep -q "^??"; then
    hook_com[staged]+="%F{red}"
  fi
}

# I added some changes so the working dir is also highlighted in green
setopt PROMPT_SUBST
export PROMPT='%n> %F{green}%1~%F{white}$vcs_info_msg_0_ %# '
