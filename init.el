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
(load "~/.emacs.d/config/spaceline")
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
