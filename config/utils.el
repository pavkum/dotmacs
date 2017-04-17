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

(message "%s" "loaded utils.")
