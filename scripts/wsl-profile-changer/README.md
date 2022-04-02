# WSL Profile Changer

A script to update the settings of a WSL profile via command line. 

Primarily a tool to change my background quickly, although other features 
are planned. 

## Usage

`python3 wsl-theme-changer.py`

| Flag           | Description                                                                                                                         | 
|----------------|-------------------------------------------------------------------------------------------------------------------------------------|
| `wsl_settings` | The fully qualified path to the settings.json file for WSL. Defaults to last known install location (manually configured in source) |
| `profile`      | Which wsl profile to look for. Will choose Ubuntu as default.                                                                       |
| `action`       | Action to perform with this script. HAS NO DEFAULT. See below for list of actions                                                   |


| Action            | Description/Flags                                                     | 
|-------------------|-----------------------------------------------------------------------|
| random-background | Picks a random background to display.                                 |
|                   | `folder`: source folder to pull images from. Will search recursively. |


