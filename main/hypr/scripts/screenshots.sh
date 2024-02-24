#!/bin/bash 

focused_monitor_save() {
    filename=$(date +%s.png)
    mkdir -p $HOME/screenshots
    grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') $HOME/screenshots/$filename
    hyprctl notify 5 5000 0 "Screenshot: $filename saved!"
}

focused_monitor_copy() {
    grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') - | wl-copy
    hyprctl notify 5 5000 0 "Screenshot copied!"
}

region_save() {
    filename=$(date +%s.png)
    mkdir -p $HOME/screenshots
    grim -g "$(slurp)" $HOME/screenshots/$filename
    hyprctl notify 5 5000 0 "Screenshot: $filename saved!"
}

region_copy() {
    grim -g "$(slurp)" - | wl-copy
    hyprctl notify 5 5000 0 "Screenshot copied!"
}

case $1 in 
    "focused_monitor_save")
        focused_monitor_save
        ;;
    "focused_monitor_copy")
        focused_monitor_copy
        ;;
    "region_save")
        region_save
        ;;
    "region_copy")
        region_copy
        ;;
    *)
        hyprctl notify 2 5000 5 "Screenshot ERROR!!!"
esac
