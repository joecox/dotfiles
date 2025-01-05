eval "$(/opt/homebrew/bin/brew shellenv)"

### EDITOR
export EDITOR="code --wait --new-window"
export VISUAL="$EDITOR"

### Aliases
# re: Reload shell stuff
alias re="source ~/.zshrc"
# algrep: grep thru aliases
alias algrep="alias | grep"
# ll: better ls
alias ll="ls -lahoGF"

## git aliases
## mostly from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# working tree mgmt
alias ga="git add"
alias gapa="git add --patch"
alias gbd="git branch -d"
alias gco='git checkout'
alias gsta='git stash push'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gp='git push'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

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

# functions
server() {
  port=${1:-8000}
  python -m SimpleHTTPServer $port
}

# Require explicit `cd` use
# https://zsh.sourceforge.io/Doc/Release/Options.html#index-AUTOCD
unsetopt AUTO_CD

# Enable tab- and arrow-select menu
# https://unix.stackexchange.com/a/470959
zstyle ':completion:*' menu select

[[ -f "$HOME/.zshrc-local" ]] && source "$HOME/.zshrc-local"

export XDG_CONFIG_HOME="$HOME/.config"
