# mostly from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
if status --is-interactive
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
end
