;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; y,n in place of yes or no
(fset 'yes-or-no-p 'y-or-n-p) 
