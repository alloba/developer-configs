### PATH Settings
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_15_HOME=$(/usr/libexec/java_home -v15)
export JAVA_HOME=$JAVA_8_HOME
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java15='export JAVA_HOME=$JAVA_15_HOME'

export AWS_HOME=/Users/abates/.local/lib/aws/bin
if [[ $PATH != $AWS_HOME ]]; then
  export PATH=$AWS_HOME:$PATH
  # echo $AWS_HOME
fi

export PYTHON_HOME=~/Library/Python/3.8/bin
if [[ $PATH != $PYTHON_HOME ]]; then
  export PATH=$PYTHON_HOME:$PATH
  # echo $PYTHON_HOME
fi

export USER_HOME='/Users/abates/bin/'
if [[ $PATH != $USER_HOME ]]; then
  export PATH=$PATH:$USER_HOME
  # echo $USER_HOME
fi
#####

### Terminal Config
export EDITOR=/usr/bin/vim
export PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;1m\]@\[$(tput sgr0)\]\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;83m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]: \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
bind 'set completion-ignore-case on'
alias la='ls -lha'
###

### Source 
source ~/.bashrc

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash  #git auto complete pulled via curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

echo "Sourced bash profile"
