;; basics
(setq inhibit-startup-message t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

;; set up package manager
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))


;; load all my config files
(load "~/.emacs.d/config/core-settings")
(load "~/.emacs.d/config/helm-settings")
;;(load "~/.emacs.d/config/ivy-settings")
(load "~/.emacs.d/config/projectile-settings")
(load "~/.emacs.d/config/perspective-settings")
(load "~/.emacs.d/config/appearance")
(load "~/.emacs.d/config/window-settings")
(load "~/.emacs.d/config/front-end-development-settings")
(load "~/.emacs.d/config/utils")
(load "~/.emacs.d/config/version-control")
(load "~/.emacs.d/config/org-settings")
(load "~/.emacs.d/config/presentation-settings")
(load "~/.emacs.d/config/pomodoro-settings")
(load "~/.emacs.d/config/key-chord-settings")
(load "~/.emacs.d/config/typescript")
(load "~/.emacs.d/config/clojure")
(load "~/.emacs.d/config/hydra-settings")
(load "~/.emacs.d/config/pavan-functions")
(load "~/.emacs.d/config/ledger-settings")

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files (quote ("~/Dropbox/personal/org/current")))
 '(org-capture-templates
   (quote
    (("j" "Journal for today" entry
      (file+datetree "~/Dropbox/personal/org/current/daytoday.org")
      "* %?
%U
")
     ("J" "Journal for someday" entry
      (file+datetree+prompt "~/Dropbox/personal/org/current/daytoday.org")
      "* %?
%U
")
     ("t" "Add Task for today" entry
      (file+datetree "~/Dropbox/personal/org/current/daytoday.org")
      "* TASK %? 
 SCHEDULED:%t 
")
     ("T" "Add Task for someday" entry
      (file+datetree+prompt "~/Dropbox/personal/org/current/daytoday.org")
      "* TASK %? 
 SCHEDULED:%^t 
")
     ("P" "Work Project creation" entry
      (file+headline "~/Dropbox/personal/org/current/work.org" "Inbox")
      "* CAPTURED %^{Task} [%] %^{TProject}p %^{TRelease}p %^{TType}p 
 :PROPERTIES:
 :JIRA: %^{Jira|NA} 
 :END:" :empty-lines 1)
     ("w" "Work task creation" entry
      (file+headline "~/Dropbox/personal/org/current/work.org" "Tasks")
      "* TASK %^{Task} %^{TProject}p %^{TRelease}p %^{TType}p %^G  
" :empty-lines 1))))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/personal/org/current")
 '(org-global-properties
   (quote
    (("Effort_ALL" . "0:10 0:15 0:20 0:40 1:00 1:20 1:40 2:00 2:20 2:40 3:00"))))
 '(org-stuck-projects (quote ("+@waiting" nil nil "\\<IGNORE\\>")))
 '(org-tag-alist
   (quote
    ((:startgroup . nill)
     ("@work" . 119)
     ("@personal" . 112)
     (:endgroup)
     (:startgroup)
     ("@urgent" . 117)
     (:endgroup)
     (:startgroup)
     ("@tagged" . 116)
     (:endgroup)
     (:startgroup)
     ("@Week" . 101)
     ("@Month" . 77)
     ("@NotDecided" . 78)
     (:endgroup)
     (:startgroup)
     ("@waiting" . 97)
     ("@blocked" . 98)
     ("@delegated" . 100)
     (:endgroup)
     (:startgroup)
     ("@short" . 115)
     ("@medium" . 109)
     ("@long" . 108)
     (:endgroup))))
 '(org-todo-keyword-faces
   (quote
    (("HABIT" . "#D3A67D")
     ("ACHIEVED" . "#84D109")
     ("FAILED" . "#8A0806")
     ("RECURRING" . "#04BFBF")
     ("DONE" . "#40BE90")
     ("TASK" . "#8C8B74")
     ("DONE" . "#40BE90")
     ("CANCELLED" . "#42628E")
     ("CAPTURED" . "#8C8B74")
     ("READY" . "#F2B705")
     ("NEXT" . "#D98E04")
     ("WAITING" . "#D48A04")
     ("IN_PROGRESS" . "orange")
     ("COMPLETED" . "#40BE90")
     ("CANCELLED" . "#42628E"))))
 '(org-todo-keywords
   (quote
    ((sequence "TASK(t)" "WAITING(w@)" "|" "DONE(d@)" "CANCELLED(c@)")
     (sequence "RECURRING(R)" "|" "DONE(D)")
     (sequence "HABIT(H)" "|" "ACHIEVED(A)" "FAILED(F@)")
     (sequence "CAPTURED(c@/!)" "READY(r!)" "NEXT(n!)" "IN_PROGRESS(p!)" "WAITING(w@)" "|" "COMPLETED(o@)" "CANCELLED(a@)"))))
 '(package-selected-packages
   (quote
    (god-mode workgroups2 workgroups which-key web-mode use-package twilight-bright-theme tide spacemacs-theme spaceline solarized-theme smartparens scss-mode rjsx-mode rainbow-delimiters persp-projectile persp-mode-projectile-bridge paredit ox-reveal org-pomodoro org-gcal org-bullets noflet move-text monokai-theme material-theme magit ledger-mode key-chord json-mode hydra htmlize helm-projectile helm-ag git-gutter editorconfig doom-themes darkokai-theme company color-theme-sanityinc-tomorrow cider calfw-org calfw beacon atom-one-dark-theme anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
