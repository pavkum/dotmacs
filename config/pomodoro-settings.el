(use-package org-pomodoro
  :ensure t)

;; configure default pomodoro org file
(global-set-key (kbd "<f8>") (lambda () (interactive)
			       (persp-switch "day-to-day")
			       (find-file "~/Dropbox/everythingme/day-to-day.org")))
