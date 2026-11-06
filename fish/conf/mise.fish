fish_add_path /opt/homebrew/bin

if status --is-interactive
    mise activate fish | source
else
    mise activate fish --shims | source
end
