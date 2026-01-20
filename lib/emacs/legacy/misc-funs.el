(defun open-line-above ()
  "open a line above the current line, leave point at the beginning
of the new line."
  (interactive)
  (beginning-of-line nil)
  (open-line 1))

(defun at-top ()
  "redraw the current window with point at the top."
  (interactive)
  (recenter 0))

(defun up-one ()
  (interactive)
  (scroll-up 1))

(defun down-one ()
  (interactive)
  (scroll-down 1))

(defun oly-real-insert-tag (tag)
  "insert a tag before a function declaration"
  (beginning-of-line)
  (insert-string
   "\n/****************************************************************\n"
   " * TAG( " tag " )\n"
   " * \n"
   " * \n"
   " */\n"))

(defun oly-tag-func (name)
  "insert a taged function header"
  (interactive
   (let* ((default (find-tag-default))
	  (spec (read-string
		 (if default
		     (format "Funtion name: (default %s) " default)
		   "Function name: "))))
     (list (if (equal spec "")
	       default
	     spec))))
  (require 'tags)
  (oly-real-insert-tag name))

(defun ins-cut-line ()
  "insert a \"cut-here\" line"
  (interactive)
  (insert-string "------------------------------ cut here ------------------------------"))

(defun x-stuff ()
  "stuff the contents of the X selection buffer into the current buffer at
the current point"
  (interactive)
  (insert-string (x-get-selection)))

(defun copy-overlay (o)
  "Return a copy of overlay o."
  (let ((o1 (make-overlay (overlay-start o) (overlay-end o)
			  ;; FIXME: there's no easy way to find the
			  ;; insertion-type of the two markers.
			  (overlay-buffer o)))
	(props (overlay-properties o)))
    (while props
      (overlay-put o1 (pop props) (pop props)))
    o1))

(defun remove-overlays (&optional beg end name val)
  "Clear BEG and END of overlays whose property NAME has value VAL.
Overlays might be moved and/or split.
BEG and END default respectively to the beginning and end of buffer."
  ;; This speeds up the loops over overlays.
  (unless beg (setq beg (point-min)))
  (unless end (setq end (point-max)))
  (overlay-recenter end)
  (if (< end beg)
      (setq beg (prog1 end (setq end beg))))
  (save-excursion
    (dolist (o (overlays-in beg end))
      (when (eq (overlay-get o name) val)
	;; Either push this overlay outside beg...end
	;; or split it to exclude beg...end
	;; or delete it entirely (if it is contained in beg...end).
	(if (< (overlay-start o) beg)
	    (if (> (overlay-end o) end)
		(progn
		  (move-overlay (copy-overlay o)
				(overlay-start o) beg)
		  (move-overlay o end (overlay-end o)))
	      (move-overlay o (overlay-start o) beg))
	  (if (> (overlay-end o) end)
	      (move-overlay o end (overlay-end o))
	    (delete-overlay o)))))))

; From John Watson, 8 DEC 2008
; http://jclark.org/weblog/2005/06/10/diffbuffer/
(load "ediff" nil t)
(defun ediff-buffer-against-file (file)
  "diff the current [edited] buffer and the file of the same name"
  (interactive
   (list (ediff-read-file-name
	  "“File to compare:" default-directory buffer-file-name)))
  (let ((buf-buf-name (buffer-name))
	(file-buf-name (create-file-buffer file)))
    (with-current-buffer file-buf-name
      (insert-file-contents file t nil nil t))
    (ediff-buffers buf-buf-name file-buf-name)))
