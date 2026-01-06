function gcobmain --description "fetch and checkout new branch from main branch" -a branchname
    argparse h/help -- $argv
    or return 1

    if set -q _flag_h
        echo "Usage: $(status current-function) <branchname>"
        return
    end

    argparse -N 1 -X 1 -- $argv
    or return 1

    set -l remote (git remote)
    set -l head_ref (git remote show $remote | grep 'HEAD branch' | sd '^.*HEAD branch: (.*)$' '$1')

    git fetch $remote $head_ref
    git checkout -b $branchname origin/$head_ref
end
