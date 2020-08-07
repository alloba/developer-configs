net use N: \\kmi.lan\kmi_root\sysapps /PERSISTENT:NO
net use P: \\kmi.lan\kmi_root\public /PERSISTENT:NO
net use S: \\172.16.10.141\IT /PERSISTENT:NO
net use W: \\kmi.lan\kmi_root\kmidata /PERSISTENT:NO
net use H: \\kmi.lan\kmi_root\HomeDirectory\abates /PERSISTENT:NO
 


REM cscript \\kmi.lan\netlogon\tools\renamedrives.vbs
cscript \\kmi.lan\netlogon\tools\renamedrives2.vbs

 


rem cscript \\kmi.lan\netlogon\tools\add_printer_IKON_6th.vbs
rem cscript \\kmi.lan\netlogon\tools\add_printer_IKON_3rd.vbs

 

REM regedit /s \\kmi.lan\NETLOGON\tools\UserShellFolders.reg
cscript \\kmi.lan\NETLOGON\tools\UserShellFolders.vbs

 

rmdir "%userprofile%\Local Settings\Application Data\Sun\Java\Deployment\cache\6.0" /s /q
