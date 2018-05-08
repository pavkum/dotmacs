(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package anzu
  :ensure t
  :config
  (global-anzu-mode)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1)
  ;; use parantheses highlight mode
  (show-paren-mode 1)
  )

;; use which key
(use-package which-key
	:ensure t 
	:config
	(which-key-mode))

;; autocomplete
(use-package company
  :ensure t
  :config
  (global-company-mode))

;; json mode
(use-package json-mode
  :ensure t)

;; avy
(use-package avy
  :ensure t)

;; god mode
;; (use-package god-mode
;;   :ensure t
;;   :config
;;   (setq god-exempt-major-modes nil)
;;   (setq god-exempt-predicates nil)
;;   (god-mode)
;;   ;;(global-set-key (kbd "M-x g") 'god-mode-all)
;;   (define-key god-local-mode-map (kbd ".") 'repeat)
;;   (define-key god-local-mode-map (kbd "i") 'god-local-mode)
;;   (define-key god-local-mode-map (kbd "C-' C-a") 'avy-goto-char)
;;   (define-key god-local-mode-map (kbd "C-' C-s") 'avy-goto-char-2)
;;   (define-key god-local-mode-map (kbd "C-' C-d") 'avy-goto-word-0)
;;   (define-key god-local-mode-map (kbd "C-' C-f") 'avy-goto-word-1)
;;   (define-key god-local-mode-map (kbd "M-g g") 'avy-goto-line)
  
;;   (require 'god-mode-isearch)
;;   (define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
;;   (define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)
;;   )

(use-package evil
  :ensure t
  :config
    (evil-mode 1))
(message "%s" "loaded utils.")

(use-package general
  :ensure t
  :config
  (setq general-default-keymaps 'evil-normal-state-map)
  (setq my-leader "SPC")
  ;; file commands
  (general-define-key
   :prefix my-leader
   "ff" 'helm-find-files
   "fs" 'save-buffer
   "fr" 'rename-file
   "fd" 'delete-file)

  ;; buffer commands
  (general-define-key
   :prefix my-leader 
   "bb" 'switch-to-buffer
   "bh" 'helm-mini
   "bk" 'kill-this-buffer
   "bK" 'kill-buffer
   "bp" 'previous-buffer
   "bn" 'next-buffer
   "br" 'rename-buffer)

  ;; projectile commands
  (general-define-key
   :prefix my-leader
   "ps" 'projectile-switch-project
   "pf" 'projectile-find-file
   "pb" 'projectile-switch-to-buffer
   "pg" 'projectile-grep)

  ;; avy settings
  (general-define-key
   :prefix my-leader
   "jco" 'avy-goto-char
   "jct" 'avy-goto-char-2
   "jwz" 'avy-goto-word-0
   "jwo" 'avy-goto-word-1)

  ;; magit status
  (general-define-key
   :prefix my-leader
   "gs" 'magit-status)

  ;; comments
  (general-define-key
   :prefix my-leader
   "ci" 'pav/js-ts-block-comments
   "cF" 'js-doc-file-doc-lines
   "cf" 'pav/js-ts-function
   "ct" 'pav/js-ts-parameter
   )
 )
