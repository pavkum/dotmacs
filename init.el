;; basics
(setq inhibit-startup-message t)

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


;; personal config ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/everythingme/gcal.org" "~/Dropbox/everythingme/i.org")))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/everythingme")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (key-chord org-pomodoro ox-reveal org-reveal htmlize all-the-icons spaceline-all-the-icons spacemacs-theme json-mode atom-one-dark-theme org-gcal noflet org-bullets company beacon anzu which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
