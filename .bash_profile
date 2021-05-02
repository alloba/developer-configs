### PATH Settings Examples.
# These are generally the direction of things that you would want to set, 
# but they will start commented out, since the particulars are likely to change 
# depending on the machine...

#export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
#export JAVA_15_HOME=$(/usr/libexec/java_home -v15)
#export JAVA_HOME=$JAVA_8_HOME
#alias java8='export JAVA_HOME=$JAVA_8_HOME'
#alias java15='export JAVA_HOME=$JAVA_15_HOME'

#export PYTHON_HOME=~/Library/Python/3.8/bin
#if [[ $PATH != $PYTHON_HOME ]]; then
#  export PATH=$PYTHON_HOME:$PATH
#  # echo $PYTHON_HOME
#fi

### Terminal Config
export EDITOR=/usr/bin/vim
#export PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;1m\]@\[$(tput sgr0)\]\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;83m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]: \[$(tput sgr0)\]"
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
eval `dircolors ~/.dircolors` # sets up directory colors... hopefully. replaces LS_COLORS/LSCOLORS

bind 'set completion-ignore-case on'
alias la='ls -lha'
###

### Source Files
source ~/.bashrc

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash  #git auto complete pulled via 'curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash'
fi

