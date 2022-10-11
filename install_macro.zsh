#!/usr/bin/env zsh

# This script creates a symbolic link from the file you pass it to the appropriate directories that Fusion
# and DaVinci Resolve recognize. It will overwrite any macros with the same name, so be careful.

# DV_MACROS = "$HOME/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Macros"
# FU_MACROS = "$HOME/Library/Application Support/Blackmagic Design/Fusion/Macros"
# I set these env variables in my .zshrc file.

# full_path() {
#     # $1 : relative filename
#     echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
# }
# This was defined in .zshenv.

local macro="$1"

[ -z $macro ] && echo "Usage: $0 [macro_file.setting]" && exit

function install() {
    ln -fs "$(full_path $1)" "$2"
}

STYLED_MACRO_NAME="$(gum style --bold $(basename $macro))"
# STYLED_MACRO_NAME="$(basename $macro)"  # no gum option

echo
echo "Installing $STYLED_MACRO_NAME to DaVinci Resolve and Fusion Studio Macros folder."
install $macro $DV_MACROS
install $macro $FU_MACROS
