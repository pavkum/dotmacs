;;install spaceline
(use-package spaceline
  :ensure t
  :config
   
  (require 'spaceline-config)
  (require 'spaceline)

  (setq   powerline-default-separator 'bar
	  spaceline-workspace-numbers-unicode t
	  spaceline-separator-dir-left '(left . left)
	  spaceline-separator-dir-right '(right . right)
	  spaceline-highlight-face-func 'spaceline-highlight-face-modified
	  spaceline-responsive t
	  powerline-height 25)
  
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
      (godmode
       :face highlight-face
       :priority 0)
      '((point-position
	line-column)
	:separator " | "
	:priority 4)
      '((buffer-id         ;; buffer name
	 remote-host)
	:priority 0)
      major-mode
      '((flycheck-error flycheck-warning flycheck-info)
	:when active
	:priority 3))
    `((org-clock
       :when active
       :priority 1)
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

