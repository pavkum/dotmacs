;;; package --- summary
;;; commentary:
;;; contains org mode settings and customizations

;;; code:
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; enable habits
(require 'org-habit)

(setq org-agenda-custom-commands
      '(("d" "Daily agenda and all TODOs"
         ((agenda "" ((org-agenda-span 'day)
		      (org-agenda-entry-types '(:scheduled))
		      (org-agenda-overriding-header "Today's overview:\n")))

	  (agenda ""
		  ((org-agenda-span 'day)
		   (org-agenda-time-grid nil)
		   (org-agenda-entry-types '(:deadline))
		   (org-deadline-warning-days 0)
		   (org-agenda-skip-function 'pav/org-skip-subtree-if-habit)
		   (org-agenda-overriding-header "Unfinished tasks:\n")))

	  (agenda ""
		  ((org-agenda-span 'day)
		   (org-agenda-time-grid nil)
		   (org-agenda-entry-types '(:deadline))
		   (org-deadline-warning-days 7)
		   (org-agenda-skip-function 'org-agenda-skip-deadline-prewarning-if-scheduled)
		   (org-agenda-overriding-header "Upcoming deadlines:\n")))
	  
	  
	  (agenda ""
	  	  ((org-agenda-span 'day)
	  	   (org-agenda-time-grid nil)
	  	   (org-agenda-skip-function
	  	    '(or (org-agenda-skip-entry-if 'notscheduled)
			 (pav/org-skip-subtree-if-habit)
			 (org-agenda-skip-entry-if 'notregexp "NEXT")))
	  	   (org-agenda-overriding-header "Work sheduled today:\n")))

	  ))
	("w" "Weekly review"
         (
	  (agenda ""
		  ((org-agenda-span 'week)
		   (org-agenda-start-on-weekday 0)
		   (org-agenda-time-grid nil)
		   (org-agenda-entry-types '(:deadline))
		   (org-deadline-warning-days 7)
		   (org-agenda-skip-function
		    '(or (pav/org-skip-subtree-if-habit)
			 (org-agenda-skip-entry-if 'todo '("DONE" "CANCELLED" "COMPLETED"))))
		   (org-agenda-overriding-header "Past and upcoming deadlines:\n")))

	  (agenda ""
		  ((org-agenda-span 'week)
		   (org-agenda-start-on-weekday 0)
		   (org-agenda-time-grid nil)
		   (org-agenda-entry-types '(:scheduled))
		   (org-agenda-skip-function
		    '(or (pav/org-skip-subtree-if-habit)
			 (org-agenda-skip-entry-if 'todo '("DONE" "CANCELLED" "COMPLETED"))))
		   (org-agenda-overriding-header "Already scheduled:\n")))

	  (stuck "")

	  (todo "READY")
	  
	  (todo "CAPTURED")
	  ))
	))

(custom-set-variables
 '(org-directory "~/Dropbox/personal/org/current")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 ;; multiples of 20;; pomodoro style
 '(org-global-properties
   '(("Effort_ALL" . "0:10 0:15 0:20 0:40 1:00 1:20 1:40 2:00 2:20 2:40 3:00")))
 '(org-stuck-projects
   '("+@waiting|+@delegated|+@blocked" ;; tags/todo match
     nil ;; todo keywords
     nil ;; tags
     "\\<IGNORE\\>" ;; exlcude list
     ))
 '(org-todo-keyword-faces
   '(;; Habits
     ("HABIT" . "#D3A67D")
     ("ACHIEVED" . "#84D109")
     ("FAILED" . "#8A0806")

     ;; recurring tasks
     ("RECURRING" . "#04BFBF")
     ("DONE" . "#40BE90")
     
     ;; tasks
     ("TASK" . "#8C8B74")
     ("DONE" . "#40BE90")
     ("CANCELLED" . "#42628E")

     ;; project / work sequence
     ("CAPTURED" . "#8C8B74")
     ("READY" . "#F2B705")
     ("NEXT" . "#D98E04")
     ("IN_PROGRESS" . "orange")
     ("COMPLETED" . "#40BE90")
     ("CANCELLED" . "#42628E")))
 '(org-tag-alist '
   ((:startgroup . nill)
    ;; for classification
    ("@work" . ?w) ("@personal" . ?p)
    (:endgroup . nil)
    ;; for priority
    (:startgroup . nil)
    ("@urgent" . ?u)
    (:endgroup . nil)
    ;; on going but other dependency
    (:startgroup . nil)
    ("@waiting" . ?W) ("@blocked" . ?b) ("@delegated" . ?d)
    (:endgroup . nil)
    ;; goals
    (:startgroup . nil)
    ("@short" . ?s) ("@medium" . ?m) ("@long" . ?l)
    (:endgroup . nil)
    ))
 '(org-todo-keywords
   '(;; general / daily chores
     (sequence "TASK(t)" "|" "DONE(d@)" "CANCELLED(c@)")
     ;; recurring
     (sequence "RECURRING(R)" "|" "DONE(D)")
     ;; goal sequence
     (sequence "HABIT(H)" "|" "ACHIEVED(A)" "FAILED(F@)")
     ;; project items sequence
     (sequence "CAPTURED(c@/!)" "READY(r!)" "NEXT(n!)" "IN_PROGRESS(p!)" "|" "COMPLETED(o@)" "CANCELLED(a@)")
     ))
 '(org-agenda-files '("~/Dropbox/personal/org/current"))
 '(org-capture-templates
      '(("j" "Journal for today" entry (file+datetree "~/Dropbox/personal/org/current/daytoday.org")
	 "* %?\n%U\n")
	("J" "Journal for someday" entry (file+datetree+prompt "~/Dropbox/personal/org/current/daytoday.org")
	 "* %?\n%U\n")
	("t" "Add Task for today" entry (file+datetree "~/Dropbox/personal/org/current/daytoday.org")
	 "* TASK %? \n SCHEDULED:%t \n")
	("T" "Add Task for someday" entry (file+datetree+prompt "~/Dropbox/personal/org/current/daytoday.org")
	 "* TASK %? \n SCHEDULED:%^t \n")
	;;("l" "Logging for today" entry (file+datetree "~/Dropbox/personal/logging.org")
	;; "* %<%H:%M> %^{Logging}p")
	;;("L" "Logging for someday" entry (file+datetree+prompt "~/Dropbox/personal/logging.org")
	;; "* %<%H:%M> %^{Logging}p")
	("w"
	 "Work task creation"
	 entry
	 (file "~/Dropbox/personal/org/current/work.org")
	 "* CAPTURED %^{Task} %^{TProject}p %^{TRelease}p %^{TType}p %^{TDeadline}p  \n :PROPERTIES:\n :JIRA: %^{Jira|NA} \n :SCENARIO: %^{scenario|NA} \n :COMMENTS: %^{comment|NA} \n :END:"
	 :empty-lines 1))))

;;; store link
(global-set-key (kbd "C-c i") 'org-store-link)

;;; org-agenda shortcut
(global-set-key (kbd "<f6>") 'pav/open-agenda)

;;; org-capture shortcut
(global-set-key (kbd "<f7>") 'org-capture)

;;; org-settings ends here
