;(load "/usr/share/emacs/site-lisp/site-gentoo")

(if (boundp 'emacs-version)
    (progn
      (if (string= (substring emacs-version 0 2) "18")
	  (setq Ever '18))
      (if (string= (substring emacs-version 0 2) "19")
	  (setq Ever '19))
      (if (string= (substring emacs-version 0 2) "20")
	  (setq Ever '20))
      (if (string= (substring emacs-version 0 2) "21")
	  (setq Ever '21))
      (if (string= (substring emacs-version 0 2) "22")
	  (setq Ever '22))
      (if (string= (substring emacs-version 0 2) "23")
	  (setq Ever '23))
      (if (string= (substring emacs-version 0 2) "24")
	  (setq Ever '24))
      t)
     (setq Ever 'unknown))


; some utility functions
(defun chomp (str)
  "Chomp trailing whitespace from STR like Perl."
  (while (string-match "\\s-+$\\|\n+\\'"
		       str)
    (setq str (replace-match "" t t str)))
  str)
(defun get-string-from-file (filePath)
  "Return filePath's file content as a string."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

; load path from file
(setq path-file (expand-file-name "~/.mypath"))
(if (file-exists-p path-file)
    (progn
      (setq path-string (chomp (get-string-from-file path-file)))
      (setenv "PATH" path-string)
      (setq exec-path (append exec-path
			      (split-string path-string "\\:")))))


(setq enable-local-variables 1)
;(setq search-exit-char ?\^M)	; make ESC work properly in search
(normal-erase-is-backspace-mode 0)	; fix the DELETE key

(setq display-time-interval 30)
;(setq auto-save-time-interval 360)
;(setq gnus-nntp-server "itchy.itsnet.com")
;(setq gnus-nntp-server "news.cs.utah.edu")
;(setq gnus-select-method '(nntp "localhost" 30303))
;(setq gnus-select-method '(nntp "gatei.part.net" 119))
;(setq mh-lib "/usr/local/nmh/lib")
(put 'eval-expression 'disabled nil)

(setq gnus-save-newsrc-file nil)
(setq gnus-select-method
      '(nntp "free.teranews.com"
	     (nntp-authinfo-user "SECRET:4dcd5d4a9167d2b173dd57a07d990c5d8ed759be:SECRET")
	     (nntp-authinfo-pass "SECRET:a4ca7ace593dadea822a8b6f12992d583e2bf016:SECRET")))

(garbage-collect)


(if (or (eq Ever '19) (eq Ever '20) (eq Ever '21) (eq Ever '22) (eq Ever '23) (eq Ever '24))
    (progn
      
;      (setq load-path (cons (expand-file-name "~/dev/android/android-mode/")
;			    load-path))
      (setq load-path (cons (expand-file-name "~/lib/emacs/")
			    load-path))

;      (setq load-path (cons
;		       (expand-file-name
;			"~/lib/emacs/gnus/gnus-5.4.65/lisp")
;		       load-path))
      (load "jlp" nil t)
;      (require 'android-mode)
;     (defcustom android-mode-sdk-dir "~/dev/android/android-sdk-linux_86")


    ;; ----- dragging and copying with mouse in one step -----
    
;    (defun mouse-drag-copy-region (click)
;     "Set and copy region by dragging mouse."
;     (interactive "e")
;     (let
;      ((init-point (posn-point (event-start click))))
;      (mouse-drag-region click)
;      (if (not (= (point) init-point))
;       (copy-region-as-kill (region-beginning) (region-end))
;      )
;     )
;    )
;    
;    (global-set-key [down-mouse-1] (quote mouse-drag-copy-region))

      ))


;(fset 'gnus-my-save
;   "to")
;(defun gnus-my-save ()
;  "ensure saving with all headers intact."
;  (interactive)
;  (gnus-summary-toggle-header '1)
;  (gnus-summary-save-article))
;(define-key gnus-summary-mode-map "o" 'gnus-my-save)

;(load "gnus-etc" nil t)

;(if (equal x-resource-name "emacs_Web")
;    (progn
;      (load "gnuserv" nil t)
;      (server-start))
;  (if (equal x-resource-name "emacs_News")
;      (progn
;	(do-gnus))))

;(defun my-ssh-proxy-xmission ()
;  (save-excursion
;    (set-buffer (generate-new-buffer (generate-new-buffer-name
;				      "*xmission ssh*")))
;    (setq xmission-ssh-buffer (current-buffer))
;    (start-process "*xmission ssh*" xmission-ssh-buffer "/usr/local/bin/ssh"
;		   "-x" "-c" "rc4" "-L" "20414:news.xmission.com:119"
;		   "xmission.com" "sleep" "36000")))

;(add-to-list 'load-path "/usr/share/emacs/site-lisp/gnuserv")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;(autoload 'gnuserv-start "gnuserv-compat")
;(gnuserv-start)

;; Options Menu Settings
;; =====================
(cond
 ((and (string-match "XEmacs" emacs-version)
       (boundp 'emacs-major-version)
       (or (and
            (= emacs-major-version 19)
            (>= emacs-minor-version 14))
           (= emacs-major-version 20))
       (fboundp 'load-options-file))
  (load-options-file (expand-file-name "~/.xemacs-options"))))
;; ============================
;; End of Options Menu Settings

(load "cperl-mode" nil t)
(defalias 'perl-mode 'cperl-mode)

(defun jlp-python-mode-hook ()
  "mods for Fusion"
  (make-local-variable 'write-contents-hooks)
  (add-hook 'write-contents-hooks 'any-mode-untabify)
)
(add-hook 'python-mode-hook 'jlp-python-mode-hook)

;(load "psvn" nil t)

(if (locate-library "edit-server")
    (progn
      (require 'edit-server)
      (edit-server-start)))

(load "yaml-mode" nil t)
(load "markdown-mode" nil t)

(load "tramp" nil t)
(add-to-list 'tramp-default-proxies-alist
	     '("" "\\`root\\'" "/ssh:%h:"))

(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(py-continuation-offset 4)
 '(scroll-bar-mode (quote right))
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(show-paren-mode t))
;(custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; '(default ((t (:foreground "#f0f0f0" :background "#000000" :size "12" :family "courier"))))
; '(cperl-array-face ((t (:foreground "orangered" :bold t))))
; '(cperl-hash-face ((t (:foreground "Red" :bold t))))
; '(cperl-nonoverridable-face ((t (:foreground "orange" :bold t))))
; '(custom-button-face ((t (:bold t :foreground "#3fdfcf"))) t)
; '(custom-group-tag-face ((t (:underline t :foreground "blue"))) t)
; '(custom-saved-face ((t (:underline t :foreground "orange"))) t)
; '(custom-state-face ((t (:foreground "green3"))) t)
; '(custom-variable-button-face ((t (:bold t :underline t :foreground "white"))) t)
; '(dired-face-permissions ((t (:foreground "green3"))))
; '(font-lock-comment-face ((t (:foreground "#ee7600"))))
; '(font-lock-doc-string-face ((t (:foreground "green3"))))
; '(font-lock-function-name-face ((t (:foreground "blue" :bold t))))
; '(font-lock-keyword-face ((t (:foreground "#f939ff"))))
; '(font-lock-preprocessor-face ((t (:foreground "red"))))
; '(font-lock-reference-face ((t (:foreground "green3"))))
; '(font-lock-string-face ((t (:foreground "green3"))))
; '(font-lock-type-face ((t (:foreground "#886fff" :bold t))))
; '(font-lock-variable-name-face ((t (:foreground "#9a2fff" :bold t))))
; '(font-lock-warning-face ((t (:foreground "Violetred" :bold t))))
; '(highlight ((t (:foreground "red3" :background "white"))))
; '(isearch ((t (:foreground "red" :background "white"))))
; '(list-mode-item-selected ((t (:foreground "green3"))) t)
; '(message-cited-text ((t (:bold t))))
; '(secondary-selection ((t (:foreground "white" :background "red"))))
; '(text-cursor ((t (:foreground "black" :background "green3"))) t)
; '(zmacs-region ((t (:background "RoyalBlue"))) t))

(add-to-list 'load-path (expand-file-name "~/lib/emacs/color-theme"))
(add-to-list 'load-path (expand-file-name "~/lib/emacs/emacs-color-theme-solarized"))
(require 'color-theme-solarized)
(color-theme-solarized-dark)

(add-to-list 'load-path (expand-file-name "~/git/full-ack"))
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

(require 'zoom-frm)
(define-key ctl-x-map [(control ?+)] 'zoom-in/out)
(define-key ctl-x-map [(control ?-)] 'zoom-in/out)
(define-key ctl-x-map [(control ?=)] 'zoom-in/out)
(define-key ctl-x-map [(control ?0)] 'zoom-in/out)

(global-set-key (if (boundp 'mouse-wheel-down-event)
		    (vector (list 'control
				  mouse-wheel-down-event))
		  [C-mouse-wheel])
		'zoom-in)
(when (boundp 'mouse-wheel-up-event)
  (global-set-key (vector (list 'control mouse-wheel-up-event))
		  'zoom-out))

(setq python-mode-dir (expand-file-name "~/lib/emacs/python-mode.el-6.2.0/"))
(add-to-list 'load-path python-mode-dir)
(setq py-install-directory python-mode-dir)
(require 'python-mode)
(setq py-shell-name "ipython")

(if (file-exists-p "/usr/local/share/emacs/site-lisp/web-mode")
    (progn
    (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/web-mode")
    (require 'web-mode)
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (setq web-mode-enable-engine-detection t)
    (setq web-mode-enable-sql-detection t)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sh-heredoc ((t (:foreground "yellow1" :weight bold)))))
