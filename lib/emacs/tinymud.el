;;; Major Mode for talking to TinyMUD

(defvar tinymud-server "daisy.learning.cs.cmu.edu"
  "Host with running tinymud game.")

(defvar tinymud-port 4201
  "Port to connect to on tinymud-server.")

(defvar tinymud-buffer-name "*TinyMUD*"
  "Name of tinymud buffer.")

(defvar tinymud-prompt ?>
  "Prompt character for TinyMUD mode.")

(defvar tinymud-page-regexp "You sense that [^ ]* is looking for you in "
  "Regular expression for detecting pages.")

(defvar tinymud-show-page t
  "If not nil, display tinymud-buffer whenever a page arrives.")

(defun tinymud-check-page ()
  ;; maybe put up buffer
  (goto-char (point-min))
  (if (and tinymud-show-page (looking-at tinymud-page-regexp))
      (progn
	(display-buffer (current-buffer))
	(message "You are being paged in %s"
		 (buffer-name (current-buffer))))))

(defun tinymud-fill-line ()
  "Fill buffer, must be a single line."
  (goto-char (point-min))
  (while (not (eobp))
    (let ((break (move-to-column (1+ fill-column))))
      (if (<= break fill-column)
	  (beginning-of-line 2)
	;; else fill
	(skip-chars-backward "^ \n")
	(if (bolp)
	    ;; can't fill, we lose
	    (beginning-of-line 2)
	  (delete-horizontal-space)
	  (insert ?\n))))))

(defvar tinymud-filter-hook '(tinymud-check-page tinymud-fill-line)
  "Function to call on each line of tinymud output.  The function is called
with no arguments and the buffer narrowed to just the line.")

(defun tinymud-filter (proc string)
  "Filter for input from tinyMUD process."
  (save-excursion
    (set-buffer (process-buffer proc))
    (goto-char (marker-position (process-mark proc)))
    (let ((start (point)))
      (insert-before-markers string)
      (let ((end (point)))
	(subst-char-in-region start end ?\^m ?\  t)
	(goto-char start)
	(beginning-of-line nil)
	(save-restriction
	  (narrow-to-region (point) end)
	  ;; call tinymud-filter-hook
	  (run-hooks 'tinymud-filter-hook)
	  (if (process-mark proc)
	      (set-marker (process-mark proc) (point-max))))))))

(defun tinymud-send ()
  "Send current line of input to tinymud."
  (interactive)
  (let ((proc (get-buffer-process (current-buffer))))
    (cond ((or (null proc)
	       (not (eq (process-status proc) 'open)))
	   (message "Not connected--- nothing sent.")
	   (insert ?\n))
	  (t
	   ;; process exists, send line
	   ;; moving to end of current line first
	   (beginning-of-line 1)
	   (let ((start (max (process-mark proc) (point))))
	     (if (equal (char-after start) tinymud-prompt)
		 (setq start (1+ start)))
	     (goto-char start)
	     (end-of-line 1)
	     (send-region proc start (point))
	     (send-string proc "\n")
	     (goto-char (point-max))
	     (insert ?\n)
	     (move-marker (process-mark proc) (point))
	     (insert tinymud-prompt))))))

(defun tinymud-quit ()
  "Quit tinymud."
  (interactive)
  (if (yes-or-no-p "Are you sure you want to quit tinymud?")
      (delete-process (get-buffer-process (current-buffer)))))

(defvar tinymud-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\n" 'tinymud-send)
    (define-key map "\r" 'tinymud-send)
    (define-key map "\^c\^c" 'tinymud-quit)
    (define-key map "\^c\^m" 'tinymud-macro-command)
    map)
  "Keymap for tinymud-mode.")

(defun tinymud-mode ()
  "Major Mode for talking to TinyMUD."
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "TinyMUD")
  (setq major-mode 'tinymud-mode)
  (set-syntax-table text-mode-syntax-table)
  (use-local-map tinymud-mode-map)
  (make-local-variable 'mode-lin-process)
  (setq mode-line-process '(":%s"))
  (run-hooks 'tinymud-mode-hook))

(defun tinymud ()
  "Connect to TinyMUD."
  (interactive)
  (let* ((buf (get-buffer-create tinymud-buffer-name))
	 (proc (get-buffer-process buf)))
    (if (and proc (eq (process-status proc) 'open))
	(switch-to-buffer buf)
      ;; else we have to start it
      (if proc (delete-process proc))
      (let ((proc (open-network-stream "TinyMUD" buf
				       tinymud-server tinymud-port)))
	(set-process-filter proc 'tinymud-filter)
	(switch-to-buffer buf)
	(goto-char (point-max))
	(set-marker (process-mark proc) (point))
	(insert tinymud-prompt)
	(tinymud-mode)))))
			   
;;; Macro Commands

(defvar tinymud-current-process nil
  "Current TinyMUD process")

(defvar tinymud-macro-expansion-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\^c\^c" 'tinymud-macro-send)
    (define-key map "\^c\^s" 'tinymud-macro-send)
    (define-key map "\^c\^]" 'tinymud-macro-abort)
    map)
  "Keymap for tinymud-macro-expansion-mode.")

(defun tinymud-macro-expansion-mode ()
  "Major Mode for mucking with TinyMUD macro expansion."
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "TinyMUD-Macro-Expansion")
  (setq major-mode 'tinymud-macro-expansion-mode)
  (set-syntax-table text-mode-syntax-table)
  (use-local-map tinymud-macro-expansion-mode-map)
  (make-local-variable 'tinymud-current-process)
  (message "Use ^C^C to send, ^C^] to abort..."))

(defun tinymud-macro-abort ()
  "Abort macro expansion buffer."
  (interactive)
  (kill-buffer (current-buffer))
  (delete-window))

(defun tinymud-macro-send ()
  "Abort macro expansion buffer."
  (interactive)
  (let ((str (buffer-string))
	(proc tinymud-current-process))
    (tinymud-macro-abort)
    (tinymud-send-string str proc)))

(defvar tinymud-macro-commands-alist nil
  "*Alist of macros (keyed by strings)")

(defun tinymud-send-string (string proc)
  "Send STRING as input to PROC"
  (send-string proc (concat string "\n")))

(defun tinymud-macro-command ()
  "Insert into stream one of the commands in tinymud-macro-commands-alist."
  (interactive)
  (let ((stuff
	 (assoc
	  (completing-read "MUD Macro: "
			   tinymud-macro-commands-alist nil t nil)
	  tinymud-macro-commands-alist)))
    (if (stringp (cdr stuff))
	(let ((buff (get-buffer-create "*Expansion*"))
	      (proc (get-buffer-process (current-buffer))))
	  (pop-to-buffer buff)
	  (erase-buffer)
	  (insert (cdr stuff))
	  (goto-char (point-min))
	  (tinymud-macro-expansion-mode)
	  (setq tinymud-current-process proc)
	  ))))
