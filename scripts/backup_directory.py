import os
import sys
import argparse
# from distutils.dir_util import copy_tree
import shutil


parser = argparse.ArgumentParser(description="Backup the provided directory, with some optional smarts")
parser.add_argument('--directory', '-d', metavar='d', type=str, nargs='?', help='Source directory to copy files from.')
parser.add_argument('--output', '-o', metavar='o', type=str, nargs='?', help='Destination directory to place files. Will create directory if it doesn\'t exist')
parser.add_argument('--clean_maven', '-m', metavar='m', type=str, nargs='?', default='true', help='Clean maven subdirectories to save space. Default true.')
parser.add_argument('--skip_errors', metavar='s', type=str, nargs='?', default='true', help='Skip file copy errors quietly.')

args = parser.parse_args()
if args.directory is None or args.output is None:
    print('Missing required argument(s).')
    print(parser.print_help())
    sys.exit(1)


# parse out command line args
starting_path = os.getcwd()  # type: str
source_directory = args.directory  # type: str
output_directory = args.output  # type: str
maven_toggle = False if (args.clean_maven is None or args.clean_maven == 'false') else True  # type: bool
skip_errors_toggle = False if (args.clean_maven == 'false') else True  # type: bool

if source_directory.startswith('~'):
    source_directory = os.path.expanduser(source_directory)
source_directory = os.path.abspath(source_directory)

if output_directory.startswith('~'):
    output_directory = os.path.expanduser(output_directory)
output_directory = os.path.abspath(output_directory)


# directories to skip during directory walk (zero out early to speed things up)
skip_scan_folders = ['.git', '.idea', 'terraform', 'venv']
# patterns to skip when copying files to destination.
skip_copy_patterns = ['.terraform*', 'venv*', 'botocore*', '.minikube*', '.sdkman*', '.m2/repositories*', '.cache*']

for root, dirs, files in os.walk(source_directory, topdown=True):
    current_dir = root.removeprefix(source_directory)
    for d in skip_scan_folders:
        try:
            dirs.remove(d)
        except ValueError:
            # on average, skip folders will not be in the list. but I'm fine just eating the exception in those cases.
            pass

    if 'pom.xml' in files and maven_toggle:
        print('Cleaning maven project: ' + current_dir)
        os.system('mvn clean -q -f ' + root + '/pom.xml')

print('Copying source to destination now (this will take a while).')
try:
    shutil.copytree(source_directory, output_directory, dirs_exist_ok=True, ignore=shutil.ignore_patterns(*skip_copy_patterns))
except shutil.Error as e:
    if not skip_errors_toggle:
        raise e
    else:
        pass
