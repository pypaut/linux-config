set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    echo ""
    echo -s -n (set_color --bold green) [ (set_color --bold blue) (prompt_pwd) (set_color --bold green) ]
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

    # Kube context
    echo -s -n (set_color --bold green) [ (set_color --bold blue) $(kubectl config current-context) (set_color --bold green) ]

    # Time
    echo -s -n (set_color --bold green) [
    echo -s -n (set_color --bold blue) $(date '+%H:%M')
    echo -s -n (set_color --bold green) ]
    echo -s (set_color normal)
end

function fish_title
    # set -q argv[1]; or set argv fish
    # Looks like ~/d/fish: git log
    # or /e/apt: fish
    # echo (fish_prompt_pwd_dir_length=1 prompt_pwd): $argv;
    echo $TERMTITLE
end

set -g fish_key_bindings fish_default_key_bindings
# set -g fish_key_bindings fish_vi_key_bindings

alias gotest='grc go test -v ./...'
alias meteo='curl wttr.in/angers'

alias k='kubectl'
alias ktx='kubectx'

alias fish_edit='nvim ~/.config/fish/config.fish'
alias fish_reload='source ~/.config/fish/config.fish'

set -x EDITOR nvim
set -x TERM xterm-256color
set -x GOPRIVATE gitlab.infra.online.net
set -x PATH "$PATH /home/geoffrey/.local/share/gem/ruby/3.0.0/bin"

# start of bold:
# set -x LESS_TERMCAP_md (set_color --bold red)
# end of all formatting:
# set -x LESS_TERMCAP_me (set_color normal)

# set -x LESS_TERMCAP_mb "$'\e[1;32m'"
# set -x LESS_TERMCAP_md "$'\e[1;32m'"
# set -x LESS_TERMCAP_me "$'\e[0m'"
# set -x LESS_TERMCAP_se "$'\e[0m'"
# set -x LESS_TERMCAP_so "$'\e[01;33m'"
# set -x LESS_TERMCAP_ue "$'\e[0m'"
# set -x LESS_TERMCAP_us "$'\e[1;4;31m'"

# bind \t forward-word
# bind \t\t complete

# bind --all
bind -e \t\t
bind -e \t

bind \t complete
