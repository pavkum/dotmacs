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


(defhydra pav/hydra-jump (:color teal
			    :columns 4)
  "Avy"
  ("a"   avy-goto-char                       "Avy char 1")
  ("s"   avy-goto-char-2                     "Avy char 2")
  ("w"   avy-goto-word-0                     "Avy go to word 0")
  ("e"   avy-goto-word-1                     "Avy go to word 1")
  
  ("z"   helm-occur                          "Helm occur")

  ("C-g"   nil "Cancel" :color blue))
