; my mods to positions.el
(defvar stack-toggle-name ?\C-@ "*Stack to put toggle stuff on temporarily.")
(defvar stack-toggle-limit 1 "*Number of toggle items at one time.")

(defun toggle-wc ()
  "Exchanges the current window configuration with the one on the top of
the window-stack-name stack."
  (interactive)
  ; first, stash the current configuration
  (put-on-stack (stackable-wc-pos) stack-toggle-name stack-toggle-limit)
  ; now, get the top config off the window-stack
  (goto-stack window-stack-name 1)
  (pop-stack window-stack-name 1)
  ; next, put the old current configuration on top of the window-stack
  (put-on-stack (stack-el stack-toggle-name) window-stack-name window-stack-limit)
  ; done.
  (stack-hack-mode-line))

(define-key stack-keymap "\C-t" 'toggle-wc)

;(defun gnus-wc ()
;  "Read news in one window.  Pop-window-configuration returns to the
;old window configuration."
;  (interactive)
;  (window-conf-call-interactively (function gnus)))

;(defun vm-wc ()
;  "Read mail in one window.  Pop-window-configuration returns to the
;old window configuration."
;  (interactive)
;  (window-conf-call-interactively (function vm)))

;(defun irc-wc ()
;  "run IRC in one window.  Pop-window-configuration returns to the
;old window configuration."
;  (interactive)
;  (window-conf-call-interactively (function irc)))

;(define-key stack-keymap "\C-n" 'gnus-wc)
(define-key stack-keymap "\C-n" 'gnus)

;(define-key stack-keymap "\C-m" 'vm-wc)
(define-key stack-keymap "\C-m" 'vm)

;(define-key stack-keymap "\C-c" 'irc-wc)
(define-key stack-keymap "\C-c" 'irc)
