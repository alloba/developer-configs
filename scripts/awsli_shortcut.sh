#!/bin/zsh

# shortcut that relies on bitwarden being preconfigured and awsli being edited to accept an environment variable instead of asking for an MFA code.
# very delicate, i dont expect it to survive moving between machines.
# relies on an edit to the awsli script from li-users. Relevant excerpt below:
#
# echo
# echo "Logging into ${AWS_ENVIRONMENT}:${selected_account_id}:${selected_group}"
#
#     if [[ -z $AWS_TOTP ]]; then
#     	echo
#     	read -p "Enter MFA code for ${username}: " token_code
#     else
# ----> token_code="${AWS_TOTP}"
#     fi
#
# echo
# echo "🎬 Assuming Role ${selected_group}"
set -e

export AWS_TOTP=$(python ~/projects/personal/developer-configs/scripts/aws_totp_bw.py)
~/projects/li-users/scripts/awsli
