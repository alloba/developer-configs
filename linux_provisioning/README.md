# Linux Setup 

Generic instructions to follow for getting a new linux installation up and running. 
Some pieces could be lightly tweaked for use on Mac as well, but I'll deal with that when I get there. 

## Pre-Install Checklist 

- Ensure dot files and ssh keys are backed up and ready to move to the new installation. 
- Review any other files to see if other items should be copied.
    - AWS config
    - .ssh 
    - .m2/settings.xml 
    - etc. 
- **If moving from Windows** 
  Intel WiFi cards don't exactly hot swap nicely between operating systems. 
  If fast boot is enabled in Windows, the card can potentially not be read by the Linux OS properly. 
  So turn that off, and ensure proper full shutdown before switching over. 

## Post Install Checklist 

- Copy dot files and ssh keys over to new machine.
- Run basic_setup.sh (in this folder) to install default applications. 
- TODO more steps
