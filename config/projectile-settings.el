(use-package projectile
  :ensure t
  :config
  (projectile-mode 1)
  (setq projectile-completion-system 'helm))

(use-package helm-projectile
  :ensure t
  :config
  (require 'projectile)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

;; (use-package counsel-projectile
;;   :ensure t
;;   :config
;;   (counsel-projectile-on))

(message "%s" "loaded projectile.")
