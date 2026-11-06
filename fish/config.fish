if status is-interactive
    mise activate fish | source
else
    mise activate fish --shims | source
end

if status is-interactive
    set fish_greeting

    /opt/homebrew/bin/brew shellenv fish | source

    # Editor
    if not set -q EDITOR
        set -gx EDITOR "code -rw"
    end
    set -gx GIT_EDITOR "$EDITOR"
    set -gx VISUAL "$EDITOR"

    # Aliases
    # re: reload shell config
    alias re "source ~/.config/fish/config.fish"
    # use GNU ls if available
    type -q gls; and alias ls "gls --color"
    # ll: better ls
    alias ll "gls --color -lahoGF"

    type -q bat; and alias cat "bat"

    # git aliases
    # mostly from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
    # working tree/committing
    alias ga "git add"
    alias gau "git add -u"
    alias gapa "git add --patch"
    alias gsta 'git stash push'
    alias gstl 'git stash list'
    alias gstp 'git stash pop'
    alias gstd 'git stash drop'
    alias grst 'git restore --staged'
    alias gc 'git commit --verbose'
    alias gc! 'git commit --verbose --amend'
    alias gwip 'git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
    alias gunwip 'git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

    # branching
    alias gb "git branch"
    alias gbd "git branch -d"
    alias gco 'git checkout'

    # remotes
    alias gp 'git push'

    # viewing
    alias gst 'git status'
    alias gd 'git diff'
    alias gds 'git diff --staged'
    alias glg 'git log --stat'
    alias gsh 'git show'

    # git merge
    alias gm 'git merge'
    alias gma 'git merge --abort'
    alias gmc 'git merge --continue'

    # git rebase
    alias grb 'git rebase'
    alias grba 'git rebase --abort'
    alias grbc 'git rebase --continue'
    alias grbi 'git rebase --interactive'

    # git cherry-pick
    alias gcp 'git cherry-pick'
    alias gcpc 'git cherry-pick --continue'
    alias gcpa 'git cherry-pick --abort'

    # Use term colors except make symlinks green
    set -gx LS_COLORS "ln=01;32"

    # Some tools such as ghostty use XDG_CONFIG_HOME
    set -gx XDG_CONFIG_HOME "$HOME/.config"
end
