(defun pav/update-cursor ()
  (if (bound-and-true-p god-local-mode)
      (setq cursor-type 'box)
    (setq cursor-type 'bar)
      ;;(set-face-attribute 'spaceline-highlight-face nil :foreground "black")
      ;;(set-face-attribute 'spaceline-highlight-face nil :foreground "pink")
  )
)

(add-hook 'god-mode-enabled-hook 'pav/update-cursor)
(add-hook 'god-mode-disabled-hook 'pav/update-cursor)

(defun pav/swap-windows ()
""
(interactive)
(require 'ace-window)
(ace-swap-window)
(aw-flip-window))

(defun pav/capture-tags ()
  "call tags"
  (interactive)
  (org-set-tags-command))

(defun pav/open-agenda ()
  ""
  (interactive)
  (require 'perspective)
  (persp-switch "dtd")
  (org-agenda))


(defun pav/insert-rupee ()
  ""
  (interactive)
  (insert-string "₹"))

(defun pav/org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))


(defun pav/org-skip-subtree-if-habit ()
  "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (string= (org-entry-get nil "STYLE") "habit")
        subtree-end
      nil)))

(defhydra pav/hydra-window ()
  "
Movement^^        ^Split^         ^Switch^		^Resize^
----------------------------------------------------------------
_h_ ←       	_v_ertical    	_b_uffer		_q_ X←
_j_ ↓        	_x_ horizontal	_f_ind files	_w_ X↓
_k_ ↑        	_z_ undo      	_a_ce 1		_e_ X↑
_l_ →        	_Z_ reset      	_s_wap		_r_ X→
_F_ollow		_D_lt Other   	_S_ave		max_i_mize
_SPC_ cancel	_o_nly this   	_d_elete	
"
  ("h" windmove-left )
  ("j" windmove-down )
  ("k" windmove-up )
  ("l" windmove-right )
  ("q" hydra-move-splitter-left)
  ("w" hydra-move-splitter-down)
  ("e" hydra-move-splitter-up)
  ("r" hydra-move-splitter-right)
  ("b" helm-mini)
  ("f" helm-find-files)
  ("F" follow-mode)
  ("a" (lambda ()
	 (interactive)
	 (ace-window 1)
	 (add-hook 'ace-window-end-once-hook
		   'hydra-window/body))
   )
  ("v" (lambda ()
	 (interactive)
	 (split-window-right)
	 (windmove-right))
   )
  ("x" (lambda ()
	 (interactive)
	 (split-window-below)
	 (windmove-down))
   )
  ("s" (lambda ()
	 (interactive)
	 (ace-window 4)
	 (add-hook 'ace-window-end-once-hook
		   'hydra-window/body)))
  ("S" save-buffer)
  ("d" delete-window)
  ("D" (lambda ()
	 (interactive)
	 (ace-window 16)
	 (add-hook 'ace-window-end-once-hook
		   'hydra-window/body))
   )
  ("o" delete-other-windows)
  ("i" ace-maximize-window)
  ("z" (progn
	 (winner-undo)
	 (setq this-command 'winner-undo))
   )
  ("Z" winner-redo)
  ("SPC" nil)
  )

(defhydra pav/hydra-rectangle (:body-pre (rectangle-mark-mode 1)
                                     :color pink
                                     :hint nil
                                     :post (deactivate-mark))
  "
  ^_k_^       _w_ copy      _o_pen       _N_umber-lines            |\\     -,,,--,,_
_h_   _l_     _y_ank        _t_ype       _e_xchange-point          /,`.-'`'   ..  \-;;,_
  ^_j_^       _d_ kill      _c_lear      _r_eset-region-mark      |,4-  ) )_   .;.(  `'-'
^^^^          _u_ndo        _C-g_ quit     ^ ^                     '---''(./..)-'(_\_)
"
  ("k" rectangle-previous-line)
  ("j" rectangle-next-line)
  ("h" rectangle-backward-char)
  ("l" rectangle-forward-char)
  ("d" kill-rectangle)                    ;; C-x r k
  ("y" yank-rectangle)                    ;; C-x r y
  ("w" copy-rectangle-as-kill)            ;; C-x r M-w
  ("o" open-rectangle)                    ;; C-x r o
  ("t" string-rectangle)                  ;; C-x r t
  ("c" clear-rectangle)                   ;; C-x r c
  ("e" rectangle-exchange-point-and-mark) ;; C-x C-x
  ("N" rectangle-number-lines)            ;; C-x r N
  ("r" (if (region-active-p)
           (deactivate-mark)
         (rectangle-mark-mode 1)))
  ("u" undo nil)
  ("C-g" nil))      ;; ok


(defhydra pav/hydra-jump (:color teal)
  "Avy"
  ("a"   avy-goto-char                       "Avy char 1")
  ("s"   avy-goto-char-2                     "Avy char 2")
  ("w"   avy-goto-word-0                     "Avy go to word 0")
  ("e"   avy-goto-word-1                     "Avy go to word 1")
  
  ("z"   helm-occur                          "Helm occur")

  ("C-g"   nil "Cancel" :color blue))

(defun pav/insert-and-indent (value)
  "inserts in a newline and indents according to mode"
  (interactive)
  (newline-and-indent)
  (insert value)
  (indent-according-to-mode))

(defun pav/open-js-ts-comment ()
  "opens comment block"
  (pav/insert-and-indent "/*"))

(defun pav/close-js-ts-comment ()
  "closes comment block"
  (pav/insert-and-indent "*/"))

(defun pav/insert-js-ts-jsdoc-value (value)
  "inserts js-doc parameter value"
  (pav/insert-and-indent (concat "* " value)))


(defun pav/goto-first-line-of-comment-after-comment (&optional line)
  "Goes to first line of comment block"
  (interactive)
  (unless line (setq line 2))
  (forward-line line)
  (end-of-line)
  (evil-append line))

(defun pav/js-ts-parameter ()
         "Configure multi-line comments."
	 (interactive)
	 (forward-line -1)
	 (save-excursion
	 (pav/open-js-ts-comment)
	 (pav/insert-js-ts-jsdoc-value "@parameter")
	 (pav/insert-js-ts-jsdoc-value "@name $name")
	 (pav/close-js-ts-comment))
	 (pav/goto-first-line-of-comment-after-comment 3))

(defun pav/js-ts-function ()
  "Inserts function comment"
  (interactive)
  (forward-line -1)
  (save-excursion
  (pav/open-js-ts-comment)
  (pav/insert-js-ts-jsdoc-value "@function")
  (pav/insert-js-ts-jsdoc-value "@name $name")
  (pav/insert-js-ts-jsdoc-value "@param {$type} $name")
  (pav/insert-js-ts-jsdoc-value "@param {$type} $name")
  (pav/insert-js-ts-jsdoc-value "@returns {$type} $description")
  (pav/close-js-ts-comment))
  (pav/goto-first-line-of-comment-after-comment 3))
