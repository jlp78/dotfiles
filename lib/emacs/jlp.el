(load "misc-funs" nil t)

(add-hook 'gfm-mode-hook 'turn-off-auto-fill)
;(add-hook 'gfm-mode-hook 'turn-on-visual-line-mode)

(defun my-text-mode-hook ()
  "Customize text-mode hooks."
  ;; Enable auto-fill-mode, except when using markdown- or gfm- modes
  (if (or (eq major-mode 'gfm-mode)
	  (eq major-mode 'markdown-mode))
      (progn
	(visual-line-mode 1))
    (progn
      (turn-on-auto-fill))))

(setq-default case-fold-search t)
(add-hook 'text-mode-hook 'my-text-mode-hook)
(add-hook 'my-mh-draft-mode-hook 'turn-on-auto-fill)
(setq enable-recursive-minibuffers t)
(setq track-eol nil)
(setq list-directory-brief-switches "-aCF")
(setq list-directory-verbose-switches "-al")

(setq make-backup-files nil) 
(setq require-final-newline 1)
(setq scroll-step 1)
(setq scroll-conservatively 60)
(setq delete-old-versions t)
(setq visible-bell t)
(setq auto-mode-alist
      '(("\\.crypt$"              . text-mode)
	("\\.rb$"                 . ruby-mode)
	("\\.py$"                 . python-mode)
	("\\.org$"                . org-mode)
	("\\.pic$"    		  . picture-mode)
	("\\.pl$"     		  . cperl-mode)
	("\\.pm$"     		  . cperl-mode)
	("\\.otl$"    		  . outline-mode)
	("\\.tbl$"    		  . nroff-mode)
	("\\.txt$"    		  . text-mode)
	("\\.ms$"     		  . nroff-mode)
	("\\.me$"     		  . nroff-mode)
	("\\.c$"      		  . c-mode)
	("\\.y$"      		  . c-mode)
	("\\.h$"      		  . c-mode)
	("\\.el$"     		  . emacs-lisp-mode)
	("\\.js$"		  . js2-mode)
	("\\.text$"   		  . text-mode)
	("\\.tex$"    		  . TeX-mode)
	("\\.scm$"    		  . scheme-mode)
	("\\.l$"      		  . lisp-mode)
	("\\.lisp$"   		  . lisp-mode)
	("\\.f$"      		  . fortran-mode)
	("\\.mss$"    		  . scribe-mode)
;	 ("\\.pl$"     		  . prolog-mode)
	("\\.TeX$"    		  . TeX-mode)
	("\\.sty$"    		  . LaTeX-mode)
	("\\.bbl$"    		  . LaTeX-mode)
	("\\.bib$"    		  . text-mode)
	("\\.article$"            . text-mode)
	("\\.letter$"             . text-mode)
	("\\.texinfo$"            . texinfo-mode)
	("\\.lsp$"     	          . lisp-mode)
	("\\.prolog$"  	          . prolog-mode)
	("^/tmp/Re"    	          . text-mode)
	("^/tmp/fol/"             . text-mode)
	("/Message[0-9]*$"        . text-mode)
	("\\.cc$"                 . c-mode)
	("\\.scm.[0-9]*$"         . scheme-mode)
	("[]>:/]\\..*emacs"       . emacs-lisp-mode)
	("\\.ml$"                 . lisp-mode)
	("\\.html$"               . html-helper-mode)
	("/.Mail/drafts/[0-9]*$"  . my-mh-draft-mode)
	("\\.md$"                 . gfm-mode) ;usually editing for github
	))

(setq mail-archive-file-name "|/usr/local/lib/mh/rcvstore -create +outbox")

; Load GNUS for news reading. -- need modifications for (ding)
;(setq gnus-your-domain "math.byu.edu")	;obsolete
;(setq gnus-your-organization "Brigham Young University") ;obsolete
;(load "gnus-etc" nil t)		;load my gnus modifications make hook?

; Setup for IRC
;(setq irc-server "irc.math.byu.edu")	;obsolete
;(setq irc-port 6667)			;obsolete

(setq uumerge-in-unix t)		;search exec-path for uumerge
(setq uudecode-directory "/tmp/.t/")


(load "auto-loads" nil t)
(load "my-bindings" nil t)

(require 'crypt)
(require 'uniquify)

(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "^\\*") ;don't muck with special buffers

(if (or (eq Ever '21) (eq Ever '22) (eq Ever '23))
    (progn

      ; iswitchb is obsolete?  look at icomplete-mode or ido-mode
      ;(iswitchb-mode 1)

      ;(defun iswitchb-local-keys ()
	;(mapc (lambda (K)
		;(let* ((key (car K)) (fun (cdr K)))
		  ;(define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	      ;'(("<right>" . iswitchb-next-match)
		;("<left>"  . iswitchb-prev-match)
		;("<up>"    . ignore             )
		;("<down>"  . ignore             ))))

      ;(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

      ;(defadvice iswitchb-kill-buffer (after rescan-after-kill activate)
	;"*Regenerate the list of matching buffer names after a kill.
;Necessary if using `uniquify' with `uniquify-after-kill-buffer-p'
;set to non-nil."
	;(setq iswitchb-buflist iswitchb-matches)
	;(iswitchb-rescan))

      ;(defun iswitchb-rescan ()
	;"*Regenerate the list of matching buffer names."
	;(interactive)
	;(iswitchb-make-buflist iswitchb-default)
	;(setq iswitchb-rescan t))

      ;(setq iswitchb-default-method 'samewindow)
      ))

(load "edmacro" nil t)

(defun jlp-c-mode-hook ()
  "Invoke jlp mods to oly-c-mode"
  ;; set C style variables
  ;(setq c-argdecl-indent 0)    obsolete?  need to revisit c-mode
  (setq c-auto-newline nil)
  ;(setq c-brace-imaginary-offset 0)
  ;(setq c-label-offset -2)
  (setq c-tab-always-indent nil)

  ;(setq c-brace-offset 0)
  ;(setq c-continued-statement-offset 4)
  ;(setq c-indent-level 0)
  (setq case-fold-search nil)
  )
(add-hook 'c-mode-hook 'jlp-c-mode-hook)

(defun fix-html-faces () "set up faces for html mode"
      (make-face 'deemphasized)
      (set-face-foreground 'deemphasized "grey40")
      ;(setq html-deemphasize-style 'deemphasized)       obsolete?
      )
(add-hook 'html-mode-hook 'turn-on-auto-fill)

(defun setup-icicles () "set up emacs for icicles"
  (setq load-path
	(cons (expand-file-name "~/lib/emacs/icicles/") load-path))
  (load "icicles" nil t)
  (icy-mode 1))

(if (eq window-system 'x)
    (progn
      (fix-html-faces)
;     (setup-icicles)
      ))

;; initialize environment (from olympus.el)
(setq inhibit-startup-message t)
(load "time" nil t)
(display-time)

;
; some stuff for pgp
;
(defun mc-install-write-mode ()
  (require 'mailcrypt)
  (if (eq window-system 'x)
      (mc-create-write-menu-bar))
  (local-set-key "\C-ce" 'mc-encrypt-message)
  (local-set-key "\C-cs" 'mc-sign-message)
  (local-set-key "\C-ca" 'mc-insert-public-key))
(add-hook 'mail-mode-hook 'mc-install-write-mode)
(add-hook 'news-reply-mode-hook 'mc-install-write-mode)
(add-hook 'my-mh-draft-mode-hook 'mc-install-write-mode)
(defun mc-install-read-mode ()
  (require 'mailcrypt)
  (let ((decrypt (nth 0 (cdr (assoc major-mode mc-modes-alist))))
	(verify (nth 1 (cdr (assoc major-mode mc-modes-alist))))
	(snarf (nth 2 (cdr (assoc major-mode mc-modes-alist)))))
    (if (not (and decrypt verify))
	(error "Decrypt, verify functions not defined for this major mode."))
    (if (not snarf)
	(setq snarf 'mc-snarf-keys))
    (local-set-key "\C-cd" decrypt)
    (local-set-key "\C-cv" verify)
    (local-set-key "\C-ca" snarf))
  (if (eq window-system 'x)
      (mc-create-read-menu-bar)))
(add-hook 'gnus-summary-mode-hook 'mc-install-read-mode)

(setq html-helper-use-expert-menu t)
(setq html-helper-do-write-file-hooks nil)
(setq html-helper-new-buffer-template
      '("<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML//EN\">\n"
	"<HTML> <HEAD>\n"
	"<TITLE>" p "</TITLE>\n</HEAD>\n\n"
	"<BODY bgcolor=\"white\">\n"
	"<H1>" p "</H1>\n\n"
	p
	"\n\n<HR>\n"
	"Note that this is a working document and it will be updated as and\n"
	"when changes are needed.  If you find any errors in this  document,\n"
	"please notify the author.<P>\n\n"
	"Jan L. Peterson<BR>\n"
	"<A href=\"mailto:jlp@peterson-tech.com\">jlp@peterson-tech.com</A>"
	"\n</BODY> </HTML>\n"))
(setq html-helper-never-indent t)

; for cperl-mode
(setq cperl-tab-always-indent nil)
(setq cperl-indent-left-aligned-comments t)
(setq cperl-indent-level 4)
(setq cperl-continued-statement-offset 4)
(setq cperl-continued-brace-offset 4)
(setq cperl-brace-offset 0)
(setq cperl-brace-imaginary-offset 0)
(setq cperl-label-offset -2)
(setq cperl-min-label-indent 1)

(defmacro join (join-char &rest others)
  (mapconcat 'identity others join-char))

;(setq my-cperl-outline-regexp
;      (concat
;       "^"				;start of line
;       "[ \\t]*"			;skip whitespace
;       "\\("				;begin capture group \1
;       (join "\\|"
;	     "=head[12]"		;POD header
;	     "package"			;package
;	     "=item"			;POD item
;	     "sub"			;subroutine definition
;	     )
;       "\\)"				;end capture group \1
;       "\\b"				;word boundary
;       ))

;(defun cperl-outline-level ()
;  (looking-at outline-regexp)
;  (let ((match (match-string 1)))
;    (cond
;     ((eq match "=head1" ) 1)
;     ((eq match "package") 2)
;     ((eq match "=head2" ) 3)
;     ((eq match "=item"  ) 4)
;     ((eq match "sub"    ) 5)
;     (t 7)
;     )))

(defun any-mode-untabify ()
  (save-excursion

    ; strip trailing white space
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (delete-region (match-beginning 0) (match-end 0)))

    ; untabify leading white space
    (goto-char (point-min))
    (if (search-forward "\t" nil t)	; no need to untabify unless
	(untabify (1- (point)) (point-max))))) ; there are tabs

(defun jlp-cperl-mode-hook ()
  "mods for Oakley"
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
;  (outline-minor-mode)
;  (abbrev-mode)

;  (setq cperl-outline-regexp 'my-cperl-outline-regexp)
;  (setq outline-regexp 'cperl-outline-regexp)
;  (setq outline-level 'cperl-outline-level)

  (make-local-variable 'write-contents-hooks)
  (add-hook 'write-contents-hooks 'any-mode-untabify)

  (whitespace-mode 1)
  )

(add-hook 'cperl-mode-hook 'jlp-cperl-mode-hook)

(defun jlp-python-mode-hook ()
  "mods for Fusion"
  (make-local-variable 'write-contents-hooks)
  (add-hook 'write-contents-hooks 'any-mode-untabify)

  (whitespace-mode 1)
  )
(add-hook 'python-mode-hook 'jlp-python-mode-hook)

(defun jlp-makefile-mode-hook ()
  "special sauce!"
  (make-local-variable 'whitespace-style)
  (setq whitespace-style '(face lines-tail trailing empty tabs-mark))
  )
(add-hook 'makefile-mode-hook 'jlp-makefile-mode-hook)
