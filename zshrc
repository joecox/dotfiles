eval "$(/opt/homebrew/bin/brew shellenv)"

# command or file exists
__exists() {
  type "$1" 2>&1 >/dev/null
}

### EDITOR
export EDITOR="code --wait --new-window"
export VISUAL="$EDITOR"

### Aliases
# re: Reload shell stuff
alias re="source ~/.zshrc"
# algrep: grep thru aliases
alias algrep="alias | grep"
# use GNU ls if available (respects LS_COLORS)
__exists gls && alias ls="gls --color"
# ll: better ls
alias ll="ls -lahoGF"

## git aliases
## mostly from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# working tree/committing
alias ga="git add"
alias gapa="git add --patch"
alias gsta='git stash push'
alias gstl='git stash list'
alias gstp='git stash pop'
alias grst='git restore --staged'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

# branching
alias gb="git branch"
alias gbd="git branch -d"
alias gco='git checkout'

# remotes
alias gp='git push'

# viewing
alias gst='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias glg='git log --stat'
alias gsh='git show'

# git merge
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'

# git rebase
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'

# git cherry-pick
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'

# server: start a file server at a random (0) or provided port
server() {
  port=${1:-0}
  python3 -m http.server $port
}

# Require explicit `cd` use
# https://zsh.sourceforge.io/Doc/Release/Options.html#index-AUTOCD
unsetopt AUTO_CD

# Enable tab- and arrow-select menu
# https://unix.stackexchange.com/a/470959
zstyle ':completion:*' menu select

# Use term colors except make symlinks green
export LS_COLORS="ln=01;32"

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %b'
export PROMPT='%B%F{blue}%~%f%F{red}${vcs_info_msg_0_}%f%b '

# make M-f/M-b/etc use slash/dash/etc as word boundaries
autoload -Uz select-word-style
select-word-style bash

# Some tools such as ghostty use XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config"

[[ -f "$HOME/.zshrc-local" ]] && source "$HOME/.zshrc-local"
