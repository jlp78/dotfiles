; set up to autoload some things
(autoload 'balance-windows "balance"
	  "Makes all visible windows the same size." t)

(autoload 'lisp-dir-apropos "lispdir"
	  "Display entries in Lisp Code Directory for TOPIC in separate window.
Calls value of lisp-dir-apropos-hook with no args if that value is non-nil."
	t)

(autoload 'find-emacs-tag "emacs-tags"
	  "Package for finding tags in emacs sources themselves." t)

(autoload 'hexl-find-file "hexl-mode"
	  "Edit a binary file in hexl-mode." t)

(autoload 'edebug-defun "edebug" t)

(autoload 'refer-find-entry "refer" nil t)

(autoload 'match-it "match"
	  "Match character after dot to its corresponding open or close." t)

(autoload 'my-mh-draft-mode "my-mh-draft-mode"
  "My modified text mode for editing MH drafts." t)

(autoload 'split-window-quietly "split-quick" nil t) ;unused?

(autoload 'unshar "unshar" nil t)

(autoload 'gnus "gnus" "Read the GNetwork GNUs." nil t)
(autoload 'gnus-post-news "gnuspost" "Post a news." nil t)

(autoload 'execute-extended-command "execcmd" "Execute an extended command."
	  t)				;unused?

(autoload 'perl-mode "perl-mode" nil t)

(autoload 'irc "irc" "IRC interface" t)

(autoload 'tinymud "tinymud" "TinyMud mode" t)

;(autoload 'ispell-word "ispell" nil t)
;(autoload 'ispell-buffer "ispell" nil t)
;(autoload 'ispell-region "ispell" nil t)
;(autoload 'ispell-complete-word "ispell" nil t)

(autoload 'gnus-grab-gif "gif" "" t)
(autoload 'uuencode-file "uu" "" t)
(autoload 'uuencode-buffer "uu" "" t)
(autoload 'uuencode-region "uu" "" t)
(autoload 'uudecode-buffer "uu" "" t)
(autoload 'uudecode-region "uu" "" t)
(autoload 'uudecode-region-replace "uu" "" t)
(autoload 'uumerge-buffer "uu" "" t)
(autoload 'mark-next-uuencode "uu" "" t)

(autoload 'html-helper-mode "html-helper-mode" "HTML Helper mode" t)

(autoload 'mc-encrypt-message "mailcrypt" nil t)
(autoload 'mc-sign-message "mailcrypt" nil t)
(autoload 'mc-insert-public-key "mailcrypt" nil t)
(autoload 'mc-gnus-summary-verify-signature "mailcrypt" nil t)
(autoload 'mc-gnus-summary-snarf-keys "mailcrypt" nil t)
(autoload 'mc-snarf-keys "mailcrypt" nil t)
(autoload 'mc-gnus-summary-decrypt-message "mailcrypt" nil t)

(autoload 'compile "compile" "Mode for running make." t)
