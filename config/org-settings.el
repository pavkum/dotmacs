;;; package --- summary
;;; commentary:
;;; contains org mode settings and customizations

;;; code:
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 '(org-directory "~/Dropbox/personal")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-todo-keyword-faces
       '(("TODO" . "#A64E4E")
	 ("SOMEDAY" . "orange")
	 ("IN_PROGRESS" . "#2C95FF")
	 ("DONE" . "#11AE13")
	 ("CANCELLED" . "#BFCFD9")))
 '(org-todo-keywords
   '((sequence "TODO(t)" "SOMEDAY(s)" "IN_PROGRESS(p)"  "|" "DONE(d)" "CANCELLED(c)")))
 '(org-agenda-files (list "~/Dropbox/personal/my-life.org"))
 '(org-capture-templates
      '(("j" "Journal" entry (file+datetree "~/Dropbox/everythingme/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a"))))

;;; org-agenda shortcut
(global-set-key (kbd "<f6>") 'org-agenda)

;;; org-capture shortcut
(global-set-key (kbd "<f7>") 'org-capture)

;;; org-settings ends here
