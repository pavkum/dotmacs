(use-package htmlize
  :ensure t)

(use-package ox-reveal
  :ensure t
  :config
  (require 'ox-reveal)
  (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/"))
