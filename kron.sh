#!/bin/bash

# Initialize kron

# Basic usage
function help()
{
   cat << HEREDOC

   Usage: kron [--action] [--args]

   optional arguments:
     -h, --help           show this help message and exit
     -n, --num NUM        pass in a number
     -t, --time TIME_STR  pass in a time string
     -v, --verbose        increase the verbosity of the bash script
     --dry-run            do a dry run, dont change any files

HEREDOC
}  
# Verify if the current dir is a git repo
if [ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]; then
  while [[ $# -gt 0 ]]; do
    case "$1" in 
        -h | --help ) help; exit; ;;
        * ) echo "Invalid argument, use kron -h or kron --help for help"; break ;; 
    esac
  done
else
  echo "Kron only works for git repositories :)"
fi

# Verify if current repo has unpushed commits

# List commits as a numbered list 