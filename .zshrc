# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# "random" = random of any installed. 
# To see current random theme, `echo $RANDOM_THEME`
ZSH_THEME="powerlevel10k/powerlevel10k"

# Completion treats - and _ as identical. 
# Must also have case-insensitive off (default behavior)
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

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
alias terraform="$HOME/tools/terraform/versions/terraform__0_12_17"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
