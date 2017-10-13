;; hide startup message
(setq inhibit-startup-message t)

;; hide toolbar
(tool-bar-mode -1)

;; hide scrollbar
(scroll-bar-mode -1)

;; hide menubar
(menu-bar-mode -1)

;; enable line numbers
(linum-mode 1)

;; switch to fullscreen mode
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; set fonts
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))

;; utf-8
(set-terminal-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

;;(use-package all-the-icons)

;; install monokai theme
(use-package spacemacs-common
  :ensure spacemacs-theme
  :config
  (setq monokai-height-minus-1 1.0
        monokai-height-plus-1 1.0
        monokai-height-plus-2 1.0
        monokai-height-plus-3 1.0
        monokai-height-plus-4 1.0)
  (setq spacemacs-theme-org-height nil
  	spacemacs-theme-org-agenda-height nil
  	spacemacs-theme-org-highlight nil)

  (load-theme 'spacemacs-dark t))

;;(use-package all-the-icons)

;;(use-package powerline
;;  :ensure t
;;  :config
;;  (powerline-height 25))

;; (use-package spaceline-all-the-icons
;;   :ensure t
;;   :config
;;   (setq spaceline-all-the-icons-separator-type 'slant)
;;   (spaceline-all-the-icons-theme)
;;   (spaceline-toggle-all-the-icons-time-off)
;;   (spaceline-all-the-icons--setup-anzu))

;; (require 'cl)
;; (require 'powerline)
;; (setq powerline-text-scale-factor 2)
;; ;;(setq powerline-default-separator 'bar)
;; (setq powerline-arrow-shape 'curve)
;; (setq powerline-default-separator-dir '(right . left))
;; ;; These two lines you really need.
;; (setq sml/theme 'powerline)
;; (sml/setup)

;; (set-face-attribute 'mode-line nil
;;                     :foreground "Black"
;;                     :background "DarkOrange"
;;                     :box nil)

;; apply proper color selected face of perspective
;; (custom-set-faces
;;  '(persp-selected-face ((t (:foreground "#da8548")))))

;; set border between frames
;;(set-face-background 'vertical-border "#3f444a")
;;(set-face-foreground 'vertical-border (face-background 'vertical-border))


(use-package paredit
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'paredit-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode-enable))

(message "%s" "applied appearance tweaks.")
