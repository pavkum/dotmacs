;;install spaceline
(use-package spaceline
  :ensure t
  :config
   
  (require 'spaceline-config)
  (require 'spaceline)

  (if window-system
    (setq
     powerline-default-separator 'bar
     powerline-height 25)
    (setq
     powerline-default-separator 'utf-8
     powerline-utf-8-separator-left #xe0b8
     powerline-utf-8-separator-right #xe0ba
     ))

  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state
	spaceline-responsive t)
	
  
(spaceline-define-segment godmode
  "Docstring"
  ;; A single form whose value is the value of the segment.
  ;; It may return a string, an image or a list of such.
  (if (bound-and-true-p god-local-mode)
    "<G>" "<I>"))

(spaceline-define-segment myhud
  "A HUD that shows which part of the buffer is currently visible."
  (powerline-hud highlight-face default-face)
  :tight t)

(defun spaceline-pavan-theme ()
    "My theme"
  (spaceline-install
    `(anzu
      (line-column  
	:priority 0
	:face highlight-face)
      '((buffer-modified
	 buffer-id         ;; buffer name
	 remote-host)
	:priority 0)
      major-mode
      '((flycheck-error flycheck-warning flycheck-info)
	:when active
	:priority 3))
    `((org-clock
       :when active
       :priority 1)
      (global
       :when active
       :priority 0)
      (projectile-root
       :when active
       :priority 3)
      (version-control
       :when active
       :priority 3)
      (selection-info
       :priority 5)
      ((buffer-encoding-abbrev
	buffer-size)
       :separator " | "
       :priority 5)
      myhud))
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

(spaceline-pavan-theme))

 (require 'helm)
 (spaceline-helm-mode)
