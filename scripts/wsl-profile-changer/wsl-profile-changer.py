import argparse

from actions import RandomBackground

# TODO: opacity changer action
# TODO: color scheme changer action

#############################
DEFAULT_WSL_SETTINGS_LOCATION = '/mnt/c/Users/alexl/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'  # folder name ugly, but it seems to be pretty consistent/long-lived.
DEFAULT_PROFILE = 'Ubuntu'
# DEFAULT_ACTION = 'random-background'  # disabling default action for now...

DEFAULT_RANDOM_IMAGE_DIR = '/mnt/c/Users/alexl/backgrounds'
###############################

# Globally supported arguments. Ensure no actions overlap with the flags or metavars.
parser = argparse.ArgumentParser(description='Change WSL profile settings for themes')
parser_wsl = parser.add_argument('--wsl_settings', metavar='w', type=str, nargs='?',default=DEFAULT_WSL_SETTINGS_LOCATION, help=f'Settings file to act upon. Default is {DEFAULT_WSL_SETTINGS_LOCATION}')
parser_profile = parser.add_argument('--profile', metavar='p', type=str, nargs='?', default=DEFAULT_PROFILE, help=f'Profile to edit. Default is {DEFAULT_PROFILE}')
parser_action = parser.add_argument('--action', metavar='a', type=str, nargs='?', help=f'Action to perform. Supported actions: random-background')

# known_args allows skipping over unregistered flags (which would be picked up by actions later)
args, unknown = parser.parse_known_args()

if args.action is None:
    print('Missing Action')
    print(parser.print_help())
    exit()

# Direct reference is safe as long as defaults were provided in the parser. So make sure that is always the case (above)
wsl_settings_location = args.wsl_settings
target_profile = args.profile
target_action_string = args.action

# All valid actions that can be taken. Additional flags are parsed at the action level during execution.
action_map = {
    'random-background': RandomBackground(wsl_settings_location, target_profile, DEFAULT_RANDOM_IMAGE_DIR)
}

action = action_map[target_action_string]
action.attach_to_parser(parser)
action.exec_action(parser)
