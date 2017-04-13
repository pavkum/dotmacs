(use-package ace-window
  :ensure t)

;; enable winner mode
(winner-mode 1)

;; enable windmove settings
(require 'windmove)
(windmove-default-keybindings)

(message "%s" "loaded window settings.")
