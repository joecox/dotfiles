if status --is-interactive
    # Add misecompsync installed completions
    if type -q misecompsync
        set -a fish_complete_path (misecompsync dir fish)
    end
end
