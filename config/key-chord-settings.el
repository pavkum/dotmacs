(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define-global ">>" 'persp-next)
  (key-chord-define-global "<<" 'persp-prev)
  (key-chord-define-global "LL" 'persp-prev)
  (key-chord-define-global "KK" 'persp-kill)
  (key-chord-define-global "PP" 'persp-switch-quick)

  ;; initialize window hydra
  (key-chord-define-global "\"\"" 'pav/hydra-window/body)

  ;; initialize rectangle hydra
  (key-chord-define-global "??" 'pav/hydra-rectangle/body)

  (key-chord-define-global "JJ" 'pav/hydra-jump/body)
  
  (key-chord-define-global "::" 'ace-window))
