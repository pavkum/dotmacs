;; hide startup message
(setq inhibit-startup-message t)

;; hide toolbar
(tool-bar-mode -1)

;; hide scrollbar
(scroll-bar-mode -1)

;; hide menubar
(menu-bar-mode -1)

;; switch to fullscreen mode
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; set fonts
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))

;; install monokai theme
(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t)
   (setq monokai-height-minus-1 0.8
        monokai-height-plus-1 1.1
        monokai-height-plus-2 1.15
        monokai-height-plus-3 1.2
        monokai-height-plus-4 1.3))

;;(use-package spaceline-all-the-icons
;;  :ensure t
;;  :config
;;  (setq spaceline-all-the-icons-separator-type 'slant)
;;  (spaceline-all-the-icons-theme)
;;  (spaceline-toggle-all-the-icons-time-off)
;;  (spaceline-all-the-icons--setup-anzu))

;; install spaceline
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'slant
	spaceline-workspace-numbers-unicode t
	spaceline-separator-dir-left '(left . left)
	spaceline-separator-dir-right '(right . right)
	spaceline-highlight-face-func 'spaceline-highlight-face-modified
	powerline-height 30)
  

  (spaceline-toggle-window-number-on)
  (spaceline-toggle-buffer-modified-on)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-major-mode-on)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-auto-compile-on)
  (spaceline-emacs-theme)

  (require 'helm)
  (spaceline-helm-mode))



(message "%s" "applied appearance tweaks.")
