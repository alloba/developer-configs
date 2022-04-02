import glob
import json
import random


class Action:
    def attach_to_parser(self, parser):
        raise Exception('NO IMPLEMENTED PARSER ATTACH')

    def exec_action(self, parser):
        raise Exception('NO IMPLEMENTED ACTION BEHAVIOR')

    def update_wsl_param(self, file_location, profile, param, target_value):
        """
        Update a particular parameter inside of a WSL profile and save the file.

        :param file_location: Fully qualified location of the WSL settings.json
        :param profile: *Name* of the profile that is to be updated. (name is a field inside the profile object)
        :param param: Parameter inside the profile to target
        :param target_value: Value to change the parameter to.
        """
        with open(file_location, 'r+') as settings_file:
            wsl_json = json.load(settings_file)
            profile_section = wsl_json['profiles']['list']
            located_profile = [x for x in profile_section if x['name'] == profile][0]
            located_profile[param] = target_value

            settings_file.seek(0)
            settings_file.write(json.dumps(wsl_json))
            settings_file.truncate()  # cut the file after the current position of the seek (all the old stuff).


class RandomBackground(Action):
    def __init__(self, settings_location, profile, default_image_directory):
        self.settings_location = settings_location
        self.profile = profile
        self.default_image_directory = default_image_directory

    def attach_to_parser(self, parser):
        parser.add_argument('--folder', '-f', metavar='f', type=str, nargs='?', default=self.default_image_directory, help='Folder to pull images from')

    # Gotta play nice with the file format that WSL expects.
    # This would be linux format -> double-escaped windows format
    def convert_file_to_terminal_string(self, path):
        s = path.split("c/")[1].replace("/", "\\\\")
        return 'C:\\\\' + s

    def exec_action(self, parser):
        args, unknown = parser.parse_known_args()
        image_dir = self.default_image_directory if args.folder is None else args.folder
        image_dir = image_dir + '/' if not image_dir.endswith('/') else image_dir

        # can be anything that WSL supports. Not sure what that includes.
        supported_file_extension_globs = ['*.png', '*.jpg', '*.jpeg']
        located_files = []
        for extension in supported_file_extension_globs:
            located_files += glob.glob(image_dir + extension, recursive=True)

        file_choice = self.convert_file_to_terminal_string(random.choice(located_files))
        self.update_wsl_param(self.settings_location, self.profile, 'backgroundImage', file_choice)
        print(f'Updated the background image for profile {self.profile} to \n{file_choice}')
