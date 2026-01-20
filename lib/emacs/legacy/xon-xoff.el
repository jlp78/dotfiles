;Kuling :/usr/alla/christer/emacs/xonxoff.el, Thu Apr 10 20:50:38 1986,
; Edit by: Christer Johansson (christer@kuling)
; Changed DOCSTRING of Xon-xoff-mode. Removed -*- line. 
;Edited: Tue Nov 19 1985 by christer@kuling (Christer Johansson)
; /usr/alla/christer/emacs/xonxoff.el Added variables C-{S,Q}-Replacement.
;Edited: Mon Nov 11 1985 by christer@kuling (Christer Johansson)
; /usr/alla/christer/emacs/xonxoff.el Works under ver. 16.60

;; Make the identity translation table.
(progn (setq keyboard-translate-table (make-string 128 0))
       (let ((i 0))
	 (while (< i 128)
	   (aset keyboard-translate-table i i)
	   (setq i (1+ i)))))

(defvar xon-xoff-mode t
  "Controls the xon-xoff mode.
If this variable is nil, xon-xoff-mode is off.")
       
(defun xon-xoff-mode (arg)
  "Xon-xoff mode's good if you want too use ^s and ^q for flow-control.
Turns Xon-xoff mode on if ARG > 0, off if ARG < 0.
With ARG = 0, Xon-xoff-mode toggles. 
If Xon-xoff-mode is on, all ^^ typed by the user will be translated to ^q
before they are interpreted in any way. Likewise ^\ will be translated to ^s.
If the options C-Q-Replacement and C-S-Replacement are set, there values will
be used instead of ^^ and ^\. ^q and ^s will be used for flow-controll in
xon-xoff-mode.
"
  (interactive "p")

  (setq xon-xoff-mode
	(if (and (zerop arg)
		 (boundp xon-xoff-mode))
	  (not xon-xoff-mode)
	  (> arg 0)))

  (set-input-mode nil xon-xoff-mode)

  (if xon-xoff-mode
      (progn (aset keyboard-translate-table
		   (if (boundp 'C-S-Replacement)
		       C-S-Replacement
		     ?\^\\)
		   ?\^s)
	     (aset keyboard-translate-table 
		   (if (boundp 'C-Q-Replacement)
		       C-Q-Replacement
		     ?\^^)
		   ?\^q))

    (aset keyboard-translate-table ?\^s ?\^s)
    (aset keyboard-translate-table ?\^q ?\^q)))

(xon-xoff-mode 0)
