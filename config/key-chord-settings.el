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
  ;;(key-chord-define-global "??" 'pav/hydra-rectangle/body)

  (key-chord-define-global "??" 'pav/hydra-jump/body)

  ;; insert rupee
  (key-chord-define-global "CC" 'pav/insert-rupee)

  ;;(key-chord-define-global "GG" 'god-local-mode)
  (key-chord-define evil-insert-state-map "JJ" 'evil-normal-state)
  (key-chord-define evil-normal-state-map "JJ" 'evil-insert-state)
  
  (key-chord-define-global "::" 'ace-window))
