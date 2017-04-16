(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

(use-package helm-projectile
  :ensure t
  :config
  (require 'projectile)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(message "%s" "loaded projectile.")
