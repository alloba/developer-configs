#not sure if i'm setting these right, but i'll certainly find out eventually. 
export SAVEHIST=100000
export HISTSIZE=100000

# iterm2 utils/integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# "random" = random of any installed.
# To see current random theme, `echo $RANDOM_THEME`
# I'm using starship instead, so this is blank.
ZSH_THEME=

# Completion treats - and _ as identical.
# Must also have case-insensitive off (default behavior)
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# zsh autocomplete installation:
$(command -v git &> /dev/null) && [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom/plugins/zsh-autosuggestions} ]] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

plugins=(git aws zsh-autosuggestions)

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
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH
[ -d $HOME/tools ] && PATH=$HOME/tools:$PATH  # any manually downloaded tools that i want to have on the path
[ -d "/home/linuxbrew/.linuxbrew/bin" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"  # brew for linux config, if installed.


# Exports
export EDITOR="vim"
export VISUAL="vim"
export XDG_CONFIG_HOME=${HOME}/.config
export AWS_CLI_AUTO_PROMPT="on-partial"  # when using the aws cli, will pop up a helper TUI if the command you typed isn't valid/returns an error
export FZF_DEFAULT_OPTS='--ansi'  # not recommended to add ansi to default opts but im doing it anyways.
export HOMEBREW_NO_AUTO_UPDATE=1  # I super do not need brew to update all my packages for me when im trying to install a single thing real quick
#if type fzf &> /dev/null; then export FZF_BASE=$(where fzf); fi  # turned this off because the terminal complains about the fzf plugin on linux

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm on mac
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # nvm completion
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm on linux
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm completion

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

if [[ -f $HOME/tools/asdf/asdf.sh ]]; then 
  source $HOME/tools/asdf/asdf.sh;
  fpath=(${ASDF_DIR}/completions $fpath);
  autoload -Uz compinit && compinit;
fi 

export PYENV_ROOT="$HOME/.pyenv"
if type pyenv &> /dev/null; then export PATH="$PYENV_ROOT/bin:$PATH"; fi
if type pyenv &> /dev/null; then eval "$(pyenv init -)"; fi
# if type pyenv &> /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


# Aliases
alias ls="ls -lha --color"
alias cdp="cd ~/projects/"
alias cdo="cd ~/projects/personal/obsidian/"
if type nvim   &> /dev/null; then alias vim="nvim"; fi
if type fd     &> /dev/null; then alias ff="fd . $HOME | fzf"; fi
if type fd     &> /dev/null; then alias ffd="fd -t d . $HOME | fzf"; fi
if type bat    &> /dev/null; then alias cat="bat --paging=never --theme=Coldark-Dark"; fi

# LabelInsight tooling for assume-role in aws.
[[ -s $HOME/projects/li-users/scripts/awsli ]] && alias awsli="~/projects/li-users/scripts/awsli"
[[ -s $HOME/projects/li-users/scripts/awsenv ]] && alias awsenv="~/projects/li-users/scripts/awsenv"
if type bw &> /dev/null && type awsli &> /dev/null; then alias awsli="~/projects/personal/developer-configs/scripts/awsli_shortcut.sh"; fi

# Fuzzy find all directories under HOME and switch to the one selected.
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

# Recursively search all git repos for text matching the string provided to the command
# Not sure why I needed this originally... how is this significantly different to ripgrep?
function ggrep {
    find . -type d -name .git | while read line; do
        (
        cd $line/..
        cwd=$(pwd)
        echo "$(tput setaf 2)$cwd$(tput sgr0)"
        git --no-pager grep -n "$@"
        )
    done
}

#ZOxide
if type zoxide &> /dev/null; 
then 
  export _ZO_ECHO=1;
  eval "$(zoxide init zsh)"; 
  alias cdp="z ~/projects/"; 
  alias ccd="z"
fi

# Starship for CLI customizations and icons.
if type starship &> /dev/null; then eval "$(starship init zsh)"; else echo "Warning: starship not installed. Expect lame text formatting."; fi

