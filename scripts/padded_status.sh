#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

surround_l_default='['
surround_r_default=']'
pad_char_default='─'

surround_l=""
surround_r=""
pad_char=""

get_settings() {
    surround_l=$(get_tmux_option "@padd_surround_l" "$surround_l_default")
    surround_r=$(get_tmux_option "@padd_surround_r" "$surround_r_default")
    pad_char=$(get_tmux_option "@padd_char" "$pad_char_default")
}

get_padded() {
    local w=$1
    local ind=$2
    local str=''
    local digits=$(echo -n $ind | wc -m | tr -d ' ')
    local line_amount=$((w - 2 - digits))
    local text_len=$((digits + 2))
    local start=$((line_amount / 2))
    for i in $(seq 0 $line_amount) ; do
        if [[ $i = $start ]] ; then
            str+="$surround_l"
            str+="$ind"
            str+="$surround_r"
        fi
        str+="$pad_char"
    done
    echo $str
}

main() {
    get_settings
    get_padded $1 $2
}

main $1 $2
