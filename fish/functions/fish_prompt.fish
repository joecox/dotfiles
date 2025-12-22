function fish_prompt --description 'Write out the prompt'
    # save statuses
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    # pwd
    set_color -o cyan
    echo -n (prompt_pwd --full-length-dir 2)
    set_color normal

    # git
    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch red --bold
    end
    echo -n (fish_vcs_prompt)

    # status
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
    echo -n $prompt_status
    set_color normal

    # spacer
    echo -n " "
end
