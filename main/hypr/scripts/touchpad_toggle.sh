#!/bin/bash

HYPRLAND_DEVICE=$(hyprctl devices -j | jq -r '.mice[] | select(.name | test("touchpad")) | .name')

if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
    printf "true" > "$STATUS_FILE"

    hyprctl notify 1 3000 0 "Touchpad enabled."

    hyprctl keyword "device:$HYPRLAND_DEVICE:enabled" true
}

disable_touchpad() {
    printf "false" > "$STATUS_FILE"

    hyprctl notify 1 3000 0 "Touchpad disabled."

    hyprctl keyword "device:$HYPRLAND_DEVICE:enabled" false
}

if ! [ -f "$STATUS_FILE" ]; then
    enable_touchpad
else
    if [ $(cat "$STATUS_FILE") = "true" ]; then
        disable_touchpad
    elif [ $(cat "$STATUS_FILE") = "false" ]; then
        enable_touchpad
    fi
fi
