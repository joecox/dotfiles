if status is-interactive
    set fish_greeting

    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Editor
    set -gx GIT_EDITOR "zed --wait"
    set -gx VISUAL "$GIT_EDITOR"

    # Alias/Abbr
    # re: reload shell config
    abbr -a re "source ~/.config/fish/config.fish"
    # algrep: grep thru aliases
    abbr -a algrep "alias | grep"
    # use GNU ls if available
    type -q gls; and abbr -a ls "gls --color"
    # ll: better ls
    abbr -a ll "ls -lahoGF"

    # git aliases
    # mostly from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
    # working tree/committing
    abbr -a ga "git add"
    abbr -a gapa "git add --patch"
    abbr -a gsta 'git stash push'
    abbr -a gstl 'git stash list'
    abbr -a gstp 'git stash pop'
    abbr -a gstd 'git stash drop'
    abbr -a grst 'git restore --staged'
    abbr -a gc 'git commit --verbose'
    abbr -a gc! 'git commit --verbose --amend'
    abbr -a gwip 'git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
    abbr -a gunwip 'git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

    # branching
    abbr -a gb "git branch"
    abbr -a gbd "git branch -d"
    abbr -a gco 'git checkout'

    # remotes
    abbr -a gp 'git push'

    # viewing
    abbr -a gst 'git status'
    abbr -a gd 'git diff'
    abbr -a gds 'git diff --staged'
    abbr -a glg 'git log --stat'
    abbr -a gsh 'git show'

    # git merge
    abbr -a gm 'git merge'
    abbr -a gma 'git merge --abort'
    abbr -a gmc 'git merge --continue'

    # git rebase
    abbr -a grb 'git rebase'
    abbr -a grba 'git rebase --abort'
    abbr -a grbc 'git rebase --continue'
    abbr -a grbi 'git rebase --interactive'

    # git cherry-pick
    abbr -a gcp 'git cherry-pick'
    abbr -a gcpc 'git cherry-pick --continue'
    abbr -a gcpa 'git cherry-pick --abort'

    # Use term colors except make symlinks green
    # TODO: doesn't work
    # set -gx LS_COLORS "ln=01;32"

    # Some tools such as ghostty use XDG_CONFIG_HOME
    set -gx XDG_CONFIG_HOME "$HOME/.config"
end
