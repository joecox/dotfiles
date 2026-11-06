if status --is-interactive
    # use uutils GNU-compatible ls if available
    if type -q coreutils
        alias ls "coreutils ls --color"
        alias ll "coreutils ls --color -lahoGF"
    end
    # use bat if available
    type -q bat; and alias cat "bat"
end
