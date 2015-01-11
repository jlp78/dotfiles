; my key bindings

(global-set-key "\eB" 'balance-windows)
(define-key emacs-lisp-mode-map "\C-xx" 'edebug-defun)
(global-set-key "\C-x%" 'match-it)
(global-set-key "\eg" 'goto-line)
(global-set-key "\C-x;" 'kill-comment)
(global-set-key "" 'buffer-menu)
(global-set-key "\C-X\C-E" 'compile)
(global-set-key "\C-X\C-N" 'next-error)
(global-set-key "\C-X\C-K" 'kill-compilation)

; Outline-minor-mode key map
(define-prefix-command 'cm-map nil "Outline-")
; HIDE
(define-key cm-map "q" 'hide-sublevels)	;hide everything but the top-level headings
(define-key cm-map "t" 'hide-body)	;hide everything but headings
(define-key cm-map "o" 'hide-other)	;hide other branches
(define-key cm-map "c" 'hide-entry)	;hide this entry's body
(define-key cm-map "l" 'hide-leaves)	;hide body lines in this entry and sub-entries
(define-key cm-map "d" 'hide-subtree)	;hide everything in this entry and sub-entries
; SHOW
(define-key cm-map "a" 'show-all)	;show (expand) everything
(define-key cm-map "e" 'show-entry)	;show this heading's body
(define-key cm-map "i" 'show-children)	;show this heading's immediate child sub-headings
(define-key cm-map "k" 'show-branches)	;show all sub-headings under this heading
(define-key cm-map "s" 'show-subtree)	;show (expand) everything in this heading and below
; MOVE
(define-key cm-map "u" 'outline-up-heading) ;up
(define-key cm-map "n" 'outline-next-visible-heading) ;next
(define-key cm-map "p" 'outline-previous-visible-heading) ;previous
(define-key cm-map "f" 'outline-forward-same-level) ;forward, same level
(define-key cm-map "b" 'outline-backward-same-level) ;back, same level
(global-set-key "\M-o" cm-map)

; for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

; for ediff
(global-set-key "\C-cd" 'ediff-buffer-against-file)
