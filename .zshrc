# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# "random" = random of any installed. 
# To see current random theme, `echo $RANDOM_THEME`
# I'm using starship instead, so this is blank.
ZSH_THEME=""


# Completion treats - and _ as identical. 
# Must also have case-insensitive off (default behavior)
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git fzf aws)

source $ZSH/oh-my-zsh.sh

# ### ## ### ## ### ## ### ## ### ## ### #
# ### ## ### ## ### ## ### ## ### ## ### #
# User configuration
# ### ## ### ## ### ## ### ## ### ## ### #
# ### ## ### ## ### ## ### ## ### ## ### #

# SSH Specific behavior
# if [[ $SSH_CONNECTION ]]; then
#   echo "AM SSH!"
# fi

PATH=$HOME/tools:$PATH

export EDITOR="nvim"
export VISUAL="nvim"
export XDG_CONFIG_HOME=${HOME}/.config
export FZF_BASE=$(where fzf)
export AWS_CLI_AUTO_PROMPT="on-partial"


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # nvm completion 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# bet. ^
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


alias vim="nvim"
alias ls="la --color"
alias ff="fd . $HOME | fzf"
alias ffd="fd -t d . $HOME | fzf"
if command -v bat &> /dev/null; then alias cat="bat --paging=never --theme=Coldark-Dark"; fi

alias awsli="~/projects/li-users/scripts/awsli"
alias awsenv="~/projects/li-users/scripts/awsenv"

function cfd {
    selected_path=$(ffd) 
    exit_status=$?
    if [[ $exit_status -eq 0 ]] 
    then 
        cd $selected_path
    else 
        return #non-0 indicates failure or no selection made.  
    fi
}
if command -v starship &> /dev/null; then eval "$(starship init zsh)"; fi

