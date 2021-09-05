#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***

main () {
    if [[ $# -lt 1 ]]; then 
        echo "false"
    elif [[ $# -eq 1 ]]; then
        val=$(echo "$1" | awk '{print tolower($0)}')
        chars=( {a..z} )
        pangram="true"
        for ((i=0; i<${#chars[@]}; i++)); do
            if [[ $val != *${chars[i]}* ]]; then
                pangram="false"
                break
            fi
        done
        if [[ $pangram == "false" ]]; then
            echo "false"
        else
            echo "true"
        fi
    fi
}

main "$@"