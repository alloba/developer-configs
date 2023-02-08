#!/bin/bash

# Basic workspace setup 
# Will install core applications / project structures 

# Projects folder and dev configs (this project)

PROJECT_DIR="${HOME}/projects"
DEVELOPER_CONFIG_REMOTE="git@github.com:alloba/developer-configs.git"

echo "Developer Config Project Init" 
if [ -d $PROJECT_DIR ]; then 
	echo "Project directory ${PROJECT_DIR} already exists, skipping creation." 
else
	echo "Creating project directory ${PROJECT_DIR}."
	mkdir $PROJECT_DIR
fi 

if [ -d ${PROJECT_DIR}/developer-configs ]; then 
	echo "Developer configs project already exists, pulling latest from current branch." 
	git -C ${PROJECT_DIR}/developer-configs pull 
else 
	echo "Pulling develolper configs project." 
	git pull ${DEVELOPER_CONFIG_REMOTE} ${PROJECT_DIR}/developer-configs
fi 
echo"" 


echo "Linking .config" 
cd ~/projects/developer-configs/.config
for DIR in */; do
	echo "Linking ${DIR} to config directory"
	TARGET="${HOME}/.config/${DIR}"
	if [ -L $TARGET ] ; then
		if [ -e $TARGET ]; then 
			echo "  Symlink for $TARGET exists and points to a valid location. Cannot link." 
		else
			echo "  Symlink for $TARGET exists, but is broken. Recreating Link." 
			unlink $TARGET
			ln -s ${PROJECT_DIR}/developer-configs/.config/$DIR $TARGET
		fi
	elif [ -e $TARGET ]; then 
		echo "  File $TARGET already exists and is not a link. Cannot link."
	else
		ln -s ${PROJECT_DIR}/developer-configs/.config/$DIR ${TARGET%/}
	fi 
done 
echo ""


echo "Applications Install"
apt update 
apt install software-properties-common
apt update 
mkdir -p ${HOME}/Downloads

apt install -y dos2unix
apt install -y discord 
apt install -y steam 
apt install -y neovim 

echo ""
