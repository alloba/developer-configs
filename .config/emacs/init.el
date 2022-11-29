; ON WINDOWS: 
; Emacs does not pay attention to XDG_CONFIG_HOME (it does on linux/mac)
; Therefore, you should do two things -- 
;   - Ensure that the $HOME variable is set correctly to ~. (defaults to AppData, but I hate that)
;   - Symlink $XDG_CONFIG_HOME/emacs to ~/.emacs.d 
;     ` New-Item -path ~/.emacs.d/ -itemType Junction -target C:\Users\alexl\projects\developer-configs\.config\emacs\ `

; List of packages to ensure are installed. 
(setq package-list '(gruvbox-theme))

; activate all the packages (in particular autoloads)
(package-initialize)
; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))
; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))




(load-theme 'gruvbox-dark-soft t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
