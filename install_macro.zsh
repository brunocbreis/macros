#!/usr/bin/env zsh

local macro="$1"

[ -z $macro ] && echo "Usage: $0 [macro_file.setting]" && exit

function install() {
    ln -fs "$(full_path $1)" "$DV_MACROS"
    ln -fs "$(full_path $1)" "$FU_MACROS"
}

[ $(gum confirm "This will install $(basename $macro) on both DaVinci Resolve and Fusion Studio Macros folders." \
    --affirmative="OK" --negative="Customize...") && install $macro ] && exit ||
    echo "Choose which Macros folder to install $(basename $macro) to:"

local folder=$(gum choose "DaVinci Resolve" "Fusion Studio")

[[ $folder == "DaVinci Resolve" ]] && (ln -fs "$(full_path $1)" "$DV_MACROS" && exit) ||
    ln -fs "$(full_path $1)" "$FU_MACROS"
