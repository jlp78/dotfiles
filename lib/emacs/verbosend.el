;; 
;; written by Ken Manheimer (klm@cme.nist.gov) at some time in the past
;; merged into depot by baw & snc 10-Aug-1989

(require 'sendmail)
(require 'compile)

(defun sendmail-send-it ()
  (let ((tembuf (generate-new-buffer " sendmail temp"))
	(case-fold-search nil)
	delimline
	(mailbuf (current-buffer)))
    (unwind-protect
	(save-excursion
	  (set-buffer tembuf)
	  (erase-buffer)
	  (insert-buffer-substring mailbuf)
	  (goto-char (point-max))
	  ;; require one newline at the end.
	  (or (= (preceding-char) ?\n)
	      (insert ?\n))
	  ;; Change header-delimiter to be what sendmail expects.
	  (goto-char (point-min))
	  (re-search-forward
	    (concat "^" (regexp-quote mail-header-separator) "\n"))
	  (replace-match "\n")
	  (backward-char 1)
	  (setq delimline (point-marker))
	  (if mail-aliases
	      (expand-mail-aliases (point-min) delimline))
	  (goto-char (point-min))
	  ;; ignore any blank lines in the header
	  (while (and (re-search-forward "\n\n\n*" delimline t)
		      (< (point) delimline))
	    (replace-match "\n"))
	  (let ((case-fold-search t))
	    ;; Find and handle any FCC fields.
	    (goto-char (point-min))
	    (if (re-search-forward "^FCC:" delimline t)
		(mail-do-fcc delimline))
	    ;; If there is a From and no Sender, put it a Sender.
	    (goto-char (point-min))
	    (and (re-search-forward "^From:"  delimline t)
		 (not (save-excursion
			(goto-char (point-min))
			(re-search-forward "^Sender:" delimline t)))
		 (progn
		   (forward-line 1)
		   (insert "Sender: " (user-login-name) "\n")))
	    ;; don't send out a blank subject line
	    (goto-char (point-min))
	    (if (re-search-forward "^Subject:[ \t]*\n" delimline t)
		(replace-match "")))))
    (let ((ssb-def
	   (if (fboundp 'save-some-buffers)
	       (symbol-function 'save-some-buffers))))
      (defun save-some-buffers () nil)
      (compile1 "/usr/lib/sendmail -t -oi -odi -v"
		"Mail send failed."
		"Mailing")
      (if ssb-def (fset 'save-some-buffers ssb-def)))
    (save-excursion
      (set-buffer tembuf)
      (sit-for 1 t)
      (process-send-region compilation-process (point-min) (point-max))
      (process-send-eof compilation-process))
    ))
