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
  (load-theme 'monokai t))

;; install spaceline
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'bar
	spaceline-workspace-numbers-unicode t
	spaceline-separator-dir-left '(left . left)
	spaceline-separator-dir-right '(right . right)
	spaceline-highlight-face-func 'spaceline-highlight-face-modified
	powerline-height 25)
  

  (spaceline-toggle-window-number-on)
  (spaceline-toggle-buffer-modified-on)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-major-mode-on)
  (spaceline-toggle-minor-modes-off)
  (spaceline-emacs-theme)

  (require 'helm)
  (spaceline-helm-mode))

(message "%s" "applied appearance tweaks.")
