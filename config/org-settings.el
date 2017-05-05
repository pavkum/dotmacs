(use-package org-bullets
  :ensure t
  :config
  (org-bullets-mode 1))

(custom-set-variables
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/everythingme")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 )

(global-set-key (kbd "<f6>") 'org-agenda)

(require 'ox-odt)

;;;;;;;; org-capture settings
  (global-set-key (kbd "<f7>") 'org-capture)


  (setq org-agenda-files (list "~/Dropbox/everythingme/gcal.org"
                               "~/Dropbox/everythingme/i.org"))


  (setq org-capture-templates
        '(("a" "Appointment" entry (file+headline  "~/Dropbox/everythingme/gcal.org" "Appointments")
           "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
          ("n" "Note" entry (file+headline "~/Dropbox/everythingme/notes.org" "Notes")
           "* Note %?\n%T")
           ("l" "Link" entry (file+headline "~/Dropbox/everythingme/links.org" "Links")
           "* %? %^L %^g \n%T" :prepend t)
          ("t" "To Do Item" entry (file+headline "~/Dropbox/everythingme/i.org" "To Do Items")
           "* %?\n%T" :prepend t)
	  ("d" "Day to day tasks" checkitem (file+datetree "~/Dropbox/everythingme/day-to-day.org")
	   "[ ] %i%? \n%U")
          ("j" "Journal" entry (file+datetree "~/Dropbox/everythingme/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")))


  (defadvice org-capture-finalize 
      (after delete-capture-frame activate)  
    "Advise capture-finalize to close the frame"  
    (if (equal "capture" (frame-parameter nil 'name))  
        (delete-frame)))

  (defadvice org-capture-destroy 
    (after delete-capture-frame activate)  
     "Advise capture-destroy to close the frame"  
     (if (equal "capture" (frame-parameter nil 'name))  
         (delete-frame)))  

  (use-package noflet
  :ensure t )
  (defun make-capture-frame ()
           "Create a new frame and run org-capture."
           (interactive)
           (make-frame '((name . "capture")))
           (select-frame-by-name "capture")
           (delete-other-windows)
           (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
             (org-capture)))


;; gcal synchronization
(use-package org-gcal
  :ensure t
  :config
  (load "~/.secret/.gcal.el")
  (org-gcal-fetch)
  (org-gcal-sync))


