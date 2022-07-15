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
    local width=$1
    local title=$2
    local str=''

    # titile without newlines
    # count the amount of characters
    # delete space characters
    local title_len=$(echo -n $title | wc -m | tr -d ' ')

    # length of title with surrounding characters
    local text_len=$((title_len + 2))

    # amount of line characters
    local line_amount=$((width - text_len))

    # width / 2 = center
    # text_len / 2 = start text position
    # - 2 = tmux already has 2 characters for padding
    local start=$((width / 2 - text_len / 2 - 2))

    for i in $(seq 0 $line_amount) ; do
        if [[ $i = $start ]] ; then
            str+="$surround_l"
            str+="$title"
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
