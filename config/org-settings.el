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
 '(org-tag-alist '
   ((:startgroup . nil)
    ;; for classification
    ("@WORK" . ?w) ("@PERSONAL" . ?p)
    (:endgroup . nil)
    ;; for priority
    (:startgroup . nil)
    ("@URGENT" . ?u)
    (:endgroup . nil)
    ))
 '(org-todo-keywords
   '((sequence "TODO(t)" "SOMEDAY(s)" "IN_PROGRESS(p)"  "|" "DONE(d)" "CANCELLED(c)")))
 '(org-agenda-files '("~/Dropbox/personal"))
 '(org-capture-templates
      '(("j" "Journal for today" entry (file+datetree "~/Dropbox/personal/journal.org")
	 "* %?\n%U\n")
	("J" "Journal for someday" entry (file+datetree+prompt "~/Dropbox/personal/journal.org")
	 "* %?\n%U\n")
	("t" "Add Task for today" entry (file+datetree "~/Dropbox/personal/journal.org")
	 "* TODO %? \n DEADLINE:%t \n")
	("T" "Add Task for someday" entry (file+datetree+prompt "~/Dropbox/personal/journal.org")
	 "* TODO %? \n DEADLINE:%^t \n")
	;;("l" "Logging for today" entry (file+datetree "~/Dropbox/personal/logging.org")
	;; "* %<%H:%M> %^{Logging}p")
	;;("L" "Logging for someday" entry (file+datetree+prompt "~/Dropbox/personal/logging.org")
	;; "* %<%H:%M> %^{Logging}p")
	("w"
	 "Work task creation"
	 entry
	 (file "~/Dropbox/personal/work.org")
	 "* SOMEDAY %^{Task} %^{TProject}p %^{TRelease}p %^{TType}p %^{TDeadline}p  \n :PROPERTIES:\n :JIRA: %^{Jira|NA} \n :SCENARIO: %^{scenario|NA} \n :COMMENTS: %^{comment|NA} \n :END:"
	 :empty-lines 1))))

;;; store link
(global-set-key (kbd "C-c i") 'org-store-link)

;;; org-agenda shortcut
(global-set-key (kbd "<f6>") 'org-agenda)

;;; org-capture shortcut
(global-set-key (kbd "<f7>") 'org-capture)

;;; org-settings ends here
