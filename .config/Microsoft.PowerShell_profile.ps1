# This is more meant to be a working example than a fully reproducible config file. 
# Care should be taken to place it in the correct place (~/.config is not correct) 
# (The default location is ~/OneDrive/Documents/Powershell)
#
# Setting environment variables in this file is not really standard behavior for windows, 
# setting XDG values here is just a workaround for applications that cannot handle 
# the default changing on windows (thinking specifically of Godot games). 


$env:XDG_CONFIG_HOME = 'C:\Users\alexl\.config'
$env:HOME='C:\Users\alexl'  # For Emacs, mainly (which is kind of annoying on windows regardless)

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\negligible.omp.json" | Invoke-Expression


# I'm treating functions like aliases on linux. 
# These are very specific, and will have to be customized per-machine
# TODO: extract paths out to top-levl variables in order to make it easier. 
#

#function wsl {
#        wsl --cd ~
#    }
