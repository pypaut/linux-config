if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    echo ""
    echo -s -n (set_color --bold green) [ (set_color --bold blue) (prompt_pwd) (set_color --bold green) ]
    echo -s -n (set_color --bold green) [ (set_color --bold blue) $(kubectl config current-context) (set_color --bold green) ]
    echo -s (set_color --bold green) (fish_git_prompt)
    echo -s "> " (set_color normal)
end

function fish_right_prompt -d "Write out the right prompt"
    # Error code, if any
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        echo -s -n (set_color --bold green) [
        echo -s -n (set_color --bold red) $last_status
        echo -s -n (set_color --bold green) ]
        echo -s (set_color normal)
    end

    # Time
    echo -s -n (set_color --bold green) [
    echo -s -n (set_color --bold blue) $(date '+%H:%M')
    echo -s -n (set_color --bold green) ]
    echo -s (set_color normal)
end

set -g fish_key_bindings fish_default_key_bindings
# set -g fish_key_bindings fish_vi_key_bindings
