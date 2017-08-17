(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t
  :config
  (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))"))
