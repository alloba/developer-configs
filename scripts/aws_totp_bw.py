import os
import pathlib
import subprocess
import sys
from getpass import getpass

'''
Use Bitwarden to fetch the MFA code used to log into AWS. 
(The general approach can be reused for other codes, but I only need AWS on the cli) 

The final output of this script is the current TOTP for the provided BW entry ID. 

There are two "brute force" choices made here for simplicity, which leads to slower execution time. 
2 - Determine if logged into BW -> If the rest of the environment was set up a little more carefully, i could determine this without a system call. 
2 - Always re-log to BW -> If the terminal session is already logged in, you would have to already know the session token to operate with bitwarden. I am not going to guarantee it, thus am forced to relog. 
'''


EMAIL = 'alexlbates@gmail.com'
BW_PASS_FILE_LOCATION = '~/projects/personal/developer-configs/.bw_pass'
AWS_BW_ENTRY_ID = '5cda22c2-1662-4d44-8f4f-afcb00ffc123'


def determine_if_logged_in():
    result = subprocess.run(['bw', 'login', '--check'], text=True, capture_output=True)
    if result.returncode != 0 and "not logged in" not in result.stderr:
        print('-- Unable to determined BW logged in status. Are you running in a virtual environment? --')
        print(result.stderr)
        print(result.stdout)
        raise Exception(f'Unable to determine BW logged in status')
    if 'You are logged in' in result.stdout:
        return True
    else:
        return False

def log_out_bw():
    result = subprocess.run(['bw', 'logout', '--quiet'])
    if result.returncode != 0:
        raise Exception('Failed to log out of Bitwarden')


def log_in_bw(password_file_path):
    response_splitter = 'BW_SESSION='
    processed_path = pathlib.Path(password_file_path).expanduser()

    if processed_path.exists():
        command_result = subprocess.run(['bw', 'login', EMAIL, '--passwordfile', processed_path], capture_output=True, text=True)
    else:
        sys.stderr.write(f'!! BW password file not found at {processed_path} - will prompt for bw master password directly !!\n')  # cannot print to stdout if using output to feed into a shell script.
        command_result = subprocess.run(['bw', 'login', EMAIL], capture_output=True, text=True, input=getpass())

    # command_result = subprocess.run(COMMAND, capture_output=True)
    if command_result.returncode != 0:
        raise Exception(f'Unable to authenticate with BitWarden:\n ERR: {str(command_result.stderr)}')

    # fingers crossed
    session_token = command_result.stdout.split(response_splitter)[1].strip().split('\n')[0].strip()
    os.environ['BW_SESSION'] = session_token


def fetch_aws_totp(bw_entry_id):
    totp_response = subprocess.run(['bw', 'get', 'totp', bw_entry_id], text=True, capture_output=True)
    if totp_response.returncode != 0:
        raise Exception(f'Unable to fetch totp for AWS account entry {bw_entry_id}:\nERR: {totp_response.stderr}')
    totp = totp_response.stdout
    return totp


if __name__ == '__main__':
    if determine_if_logged_in():
        log_out_bw()

    log_in_bw(BW_PASS_FILE_LOCATION)
    totp = fetch_aws_totp(AWS_BW_ENTRY_ID)
    log_out_bw()

    sys.stdout.write(totp)
    sys.exit(0)
