(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define-global ">>" 'persp-next)
  (key-chord-define-global "<<" 'persp-prev)
  (key-chord-define-global "LL" 'persp-last)
  (key-chord-define-global "KK" 'persp-kill)
  (key-chord-define-global "PP" 'persp-switch))
