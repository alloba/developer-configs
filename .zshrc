# iterm2 utils/integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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

# Exports 
export EDITOR="vim"
export VISUAL="vim"
export XDG_CONFIG_HOME=${HOME}/.config
export AWS_CLI_AUTO_PROMPT="on-partial"
if type fzf &> /dev/null; then export FZF_BASE=$(where fzf); fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # nvm completion 

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Aliases
alias ls="la --color"
alias cdp="cd ~/projects/"
if type nvim   &> /dev/null; then alias vim="nvim"; fi
if type fd     &> /dev/null; then alias ff="fd . $HOME | fzf"; fi
if type fd     &> /dev/null; then alias ffd="fd -t d . $HOME | fzf"; fi
if type bat    &> /dev/null; then alias cat="bat --paging=never --theme=Coldark-Dark"; fi

[[ -s $HOME/projects/li-users/scripts/awsli ]] && alias awsli="~/projects/li-users/scripts/awsli"
[[ -s $HOME/projects/li-users/scripts/awsenv ]] && alias awsenv="~/projects/li-users/scripts/awsenv"

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

# Finalizing
if type starship &> /dev/null; then eval "$(starship init zsh)"; fi
