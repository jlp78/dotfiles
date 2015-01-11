;From: dsill@RELAY.NSWC.NAVY.MIL
;Newsgroups: comp.emacs,gnu.emacs
;Subject: Much improved `unshar' for GNU Emacs
;Date: 25 Apr 89 15:08:59 GMT

;;;;;;;;;;;;;;;;;;;;;;;;;;; -*- Mode: Emacs-Lisp -*- ;;;;;;;;;;;;;;;;;;;;;;;;;;
;; unshar.el --- unpack shar archives in the comfort of your own Emacs
;; Author          : dsill@relay.nswc.navy.mil
;; Created On      : Fri Apr 14 10:41:57 1989
;; Last Modified By: k30b
;; Last Modified On: Fri Apr 21 12:21:54 1989
;; Update Count    : 6
;; Status          : Beta release, should be fairly safe.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; History 		
;; 21-Apr-1989		dsill
;;    Added filename paranoia
;;    Generalized parsing of file extraction shell commands
;;    Added optional creation of extraction directory
;
; This is a little quickie that unpacks "shar" files.  My reasons for wanting
; to do this within Emacs are convenience and safety.  Rather than having to 
; edit off the headers, save the archives in a file, and run /bin/sh on them, 
; one can simply type `M-x unshar' and watch it run.  Secondly, I've always
; felt a bit queasy running /bin/sh on an unknown script.  Call me paranoid.
;
; As always, please feel free to send me your comments.
;
; Dave Sill (dsill@relay.nswc.navy.mil)
;
; Note: This version doesn't check to see that the extracted files are the
; correct size, and relies on Emacs to create a backup file when extracting
; a file that already exists.

(defvar unshar-paranoid-about-files nil
  "*Non-nil means confirm each file created during archive extraction.")

(defun unshar (to-dir)
  "Safely unpack the 'shar' archive in current buffer, putting files under
the directory TO-DIR."
  (interactive "FExtract files to: ")	;would use "D", but it defaults to
					;current directory and requires
					;directory to exist.
  (if (not (file-directory-p to-dir))
      (if (y-or-n-p (concat "Create directory \"" to-dir "\" "))
	  (shell-command (concat "mkdir " to-dir))))
  (if (not (equal "/" (substring to-dir (- (length to-dir) 1))))
      (setq to-dir (concat to-dir "/")))
  (save-excursion
    (goto-char (point-min))
    (let ((last-shell-command ""))
      (while (search-forward "<<" nil t) ;find next "here doc"
	(let* ((key-string (get-here-doc-key))
	       (file-name (get-here-doc-file))
	       (shell-command (get-unshar-shell-command)))
	  (forward-line)
	  (setq beg (point))
	  (re-search-forward (concat "^" key-string))
	  (beginning-of-line)
	  (copy-region-as-kill beg (point))
	  (if (not unshar-paranoid-about-files)
	      (message "Extracting %s" file-name))
	  (save-excursion
	    (set-buffer (get-buffer-create file-name))
	    (erase-buffer)
	    (insert (car kill-ring-yank-pointer))
	    (if (not (equal shell-command last-shell-command))
		(if (not (y-or-n-p (concat "Okay to execute \""
				      shell-command "\"? ")))
		    (setq shell-command (read-string
					 "Shell command to use: "))))
	    (setq last-shell-command shell-command)
	    (shell-command-on-region (point-min) (point-max) shell-command t)
	    (if (or unshar-paranoid-about-files
		    (string-match file-name "../"))
		(if (y-or-n-p (concat "Okay to write file "
				      (concat to-dir file-name) "? "))
		    (write-file (concat to-dir file-name)))
	      (write-file (concat to-dir file-name))))))
      (message "Extraction complete."))))

(defun get-here-doc-key ()
  "Return the key that marks the end of the `here doc' being created
by the shell command on the current line."
  (while (char-equal ?\040 (following-char)) ;space
    (forward-char))
  (cond
   ((char-equal ?\047 (following-char))	;single quote
    (buffer-substring (+ (point) 1) (progn (forward-char)
					   (search-forward "'")
					   (- (point) 1))))
   ((char-equal ?\134 (following-char))	;backslash
    (buffer-substring (+ (point) 1) (progn (forward-char)
					   (re-search-forward "[^ \n]*")
					   (point))))))
   
(defun get-here-doc-file ()
  "Return the filename that the shell command on the current line is directing
output to."
  (beginning-of-line)
  (search-forward ">")
  (while (char-equal ?\040 (following-char)) ;space
    (forward-char))
  (cond
   ((char-equal ?\047 (following-char))	;single quote
    (buffer-substring (+ (point) 1) (progn (forward-char)
					   (search-forward "'")
					   (- (point) 1))))
   ((char-equal ?\076 (following-char))	;greater-than
    (error "Shar attempting to append to file."))
   (t
    (buffer-substring (point) (progn (forward-char)
				     (re-search-forward "[^ \n]*")
				     (point))))))

(defun get-unshar-shell-command ()
  "Return the shell command on the current line."
  (beginning-of-line)
  (while (not (or (char-equal ?\074 (following-char))
		  (char-equal ?\076 (following-char))))
    (re-search-forward "[^'<>]*")
    (if (char-equal ?\047 (following-char))
	(re-search-forward "[^'*]'")))
  (while (char-equal ?\040 (preceding-char))
    (backward-char))
  (buffer-substring (save-excursion (beginning-of-line) (point)) (point)))

