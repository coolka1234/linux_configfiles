#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/coolka/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/coolka/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/coolka/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/coolka/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

gacp() {
    local arg=$1
    git add .
    git commit -m "$arg"
    git push
}

cdp() {
    if [ "$1" = "p" ]; then
        builtin cd projects/python || echo "Directory not found: /projects/python"
    elif [ "$1" = "c" ]; then
        builtin cd projects/c++ || echo "Directory not found: /projects/c++"
    elif [ "$1" = "j" ]; then
        builtin cd projects/java || echo "Directory not found: /projects/java"
    elif [ "$1" = "r" ]; then
	builtin cd projects/rust || echo "Directory not found /projects/rust"
    elif [ "$1" = "c#" ]; then
	bulitin cd projects/c# || echo "Directory not found /projects/c#"
    else
	builtin cd "$@"
    fi
}

set -o vi
