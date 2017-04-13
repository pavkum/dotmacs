(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  
  ;; helm-persistent-action
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)


  ;; helm appearance
  (helm-autoresize-mode 1)
  (setq helm-autoresize-max-height 40)
  (setq helm-autoresize-min-height 40)
  (setq helm-split-window-in-side-p t)
  (setq helm-always-two-windows t)

  
  ;;helm always bottom and full width
  (add-to-list 'display-buffer-alist
  	       `(,(rx bos "*helm" (* not-newline) "*" eos)
		 (display-buffer-in-side-window)
		 (inhibit-same-window . t)
		 (window-height . 0.4)))

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-m") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-h f") 'helm-apropos)
  (global-set-key (kbd "C-h r") 'helm-info-emacs)
  (global-set-key (kbd "C-h C-l") 'helm-locate-library)
  
  (define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)
  
  (define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

  ;; enable helm-mode
  (helm-mode 1))

(use-package helm-ag
  :ensure t)

(message "%s" "loaded helm settings.")
