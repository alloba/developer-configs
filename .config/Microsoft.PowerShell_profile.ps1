# This is more meant to be a working example than a fully reproducible config file. 
# Care should be taken to place it in the correct place (~/.config is not correct) 
# (The default location is ~/OneDrive/Documents/Powershell)
# just run `echo $PROFILE` to see where powershell wants it. 

# This has barely ever helped me, and has caused a subtle bug in a game. So not changing it. 
# $env:XDG_CONFIG_HOME = 'C:\Users\alexl\.config'

$PSStyle.FileInfo.Directory = "`e[36m"
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\dracula.omp.json" | Invoke-Expression

