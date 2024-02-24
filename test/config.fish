if status is-interactive
    set -g -x fish_greeting
    fish_vi_key_bindings
    starship init fish | source
    # Commands to run in interactive sessions can go here
end

