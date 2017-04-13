(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode 1))

(message "%s" "loaded version control settings.")
