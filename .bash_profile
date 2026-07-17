### This .bash_profile should be sourced _after_ any system-specific profiles are sourced.
### E.g., after profile file that sources things like AWS keys or github keys
# source $HOME/.bash_profile_secrets
# source $HOME/bin/.bash_profile

###########################################################
### Terminal
alias ll='ls -Gl'
alias la='ls -Gla'

alias gi='git'
alias gits='git status'
alias gitss='git status -s'

alias bc='bc -l'

alias to='tee out'

alias lsofi='lsof -Pn -i'

alias gradle='./gradlew'
alias gw='./gradlew'

export EDITOR=vim

# include optional git branch in green, then current directory in yellow
function color_my_prompt() {
    local __git_branch_color="\[\033[32m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    export PS1="\u@\h $__git_branch_color$__git_branch\[\033[38;5;11m\]\W\[$(tput sgr0)\]\$ "
}
# this is the PS1 I want to use on remote machines.  It's here for easy copy access
export REMOTE_PS1='"[\u@\[\033[32m\]\h\033[0m \W]\$ "'
color_my_prompt

if [[ -f $HOME/.git-completion.bash ]] ; then
    . $HOME/.git-completion.bash
fi

# use the github API
if [[ -n "$HOMEBREW_GITHUB_API_TOKEN" ]] ; then
    alias github="curl -i -H 'Authorization: token $HOMEBREW_GITHUB_API_TOKEN'"
fi

export PATH=$PATH:$HOME/bin

###########################################################
### Python
export PIP_REQUIRE_VIRTUALENV=true


###########################################################
### Ruby

###########################################################
### Node/NPM/yarn

###########################################################
### Java
