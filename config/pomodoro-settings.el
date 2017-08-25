(use-package org-pomodoro
  :ensure t)

;; configure default pomodoro org file
(global-set-key (kbd "<f8>") (lambda () (interactive)
			       (persp-switch "dtd")
			       (find-file "~/Dropbox/personal/journal.org")))
