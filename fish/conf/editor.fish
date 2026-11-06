if status --is-interactive
    if not set -q EDITOR
        set -gx EDITOR "code -rw"
    end
    set -gx GIT_EDITOR "$EDITOR"
    set -gx VISUAL "$EDITOR"
end
