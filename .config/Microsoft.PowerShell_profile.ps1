# This is more meant to be a working example than a fully reproducible config file. 
# Care should be taken to place it in the correct place (~/.config is not correct) 
# (The default location is ~/OneDrive/Documents/Powershell)
#
# Setting environment variables in this file is not really standard behavior for windows, 
# setting XDG values here is just a workaround for applications that cannot handle 
# the default changing on windows (thinking specifically of Godot games). 



$env:XDG_CONFIG_HOME = 'C:\Users\alexl\.config'
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\negligible.omp.json" | Invoke-Expression

function emacs {
 & 'C:\Program Files\Emacs\emacs-28.2\bin\emacs.exe' --no-window-system 
}

function journal {
	python $HOME/projects/journal-assist/notes.py $HOME/projects/obsidian/ $HOME/projects/obsidian/journal/
}
