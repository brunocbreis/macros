#!/usr/bin/env zsh

local macro="$1"

[ -z $macro ] && echo "Usage: $0 [macro_file.setting]" && exit

function install() {
    ln -fs "$(full_path $1)" "$DV_MACROS"
    ln -fs "$(full_path $1)" "$FU_MACROS"
}

echo "Installing $(basename $macro) to DaVinci Resolve and Fusion Studio Macros folder."
install $macro
