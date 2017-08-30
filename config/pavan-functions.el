(defun pav/swap-windows ()
""
(interactive)
(require 'ace-window)
(ace-swap-window)
(aw-flip-window))

(defun pav/open-agenda ()
  ""
  (interactive)
  (require 'perspective)
  (persp-switch "dtd")
  (org-agenda))

