if status --is-interactive
    if not set -q EDITOR
        set -gx EDITOR "fresh --wait"
    end
    set -gx GIT_EDITOR "$EDITOR"
    set -gx VISUAL "$EDITOR"
end
