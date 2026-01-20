
;;; ====================================================================
;;;  Jan L. Peterson — Unified, Modernized Emacs Configuration
;;; ====================================================================
;;;  Integrated from:
;;;    - Optimized base config
;;;    - jlp.el
;;;    - misc-funs.el
;;;    - match-it.el (modernized; historical attribution preserved)
;;;    - my-bindings.el
;;;    - auto-loads.el (modernized & cleaned)
;;; ====================================================================

;;; --------------------------------------------------------------------
;;; Environment and Startup
;;; --------------------------------------------------------------------

(setq Ever emacs-major-version)

(defun chomp (str)
  "Trim whitespace/newlines from STR."
  (replace-regexp-in-string "[ \t\n\r]+\\'" "" str))

(defun get-string-from-file (filePath)
  "Return FILEPATH contents as a string."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

;; Load PATH from ~/.mypath if it exists
(let ((path-file (expand-file-name "~/.mypath")))
  (when (file-exists-p path-file)
    (let ((path-string (chomp (get-string-from-file path-file))))
      (setenv "PATH" path-string)
      (setq exec-path (append exec-path (split-string path-string ":"))))))

(normal-erase-is-backspace-mode 0)
(setq enable-local-variables t)
(setq display-time-interval 30)
(put 'eval-expression 'disabled nil)


;;; --------------------------------------------------------------------
;;; Package Setup
;;; --------------------------------------------------------------------

(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)


;;; --------------------------------------------------------------------
;;; Load Paths — Personal Libraries
;;; --------------------------------------------------------------------

(add-to-list 'load-path "~/lib/emacs/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")


;;; --------------------------------------------------------------------
;;; UI / Appearance
;;; --------------------------------------------------------------------

(use-package solarized-theme
  :config
  ;; Load immediately; 't' avoids confirmation prompt
  (load-theme 'solarized-dark t))
(set-face-attribute 'default nil :height 180)
(show-paren-mode 1)
(display-time)


;;; --------------------------------------------------------------------
;;; TRAMP
;;; --------------------------------------------------------------------

(require 'tramp)
(add-to-list 'tramp-default-proxies-alist '("" "\\`root\\'" "/ssh:%h:"))
(setq tramp-persistency-file-name nil)


;; ;;; --------------------------------------------------------------------
;; ;;; Zoom (Frame scaling)
;; ;;; --------------------------------------------------------------------

;; TOFIX
;; (require 'zoom-frm)
;; (define-key ctl-x-map (kbd "C-+") 'zoom-in/out)
;; (define-key ctl-x-map (kbd "C-=") 'zoom-in/out)
;; (define-key ctl-x-map (kbd "C--") 'zoom-in/out)
;; (define-key ctl-x-map (kbd "C-0") 'zoom-in/out)


;;; --------------------------------------------------------------------
;;; Mouse
;;; --------------------------------------------------------------------

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)


;;; --------------------------------------------------------------------
;;; Whitespace Mode Defaults
;;; --------------------------------------------------------------------

(setq whitespace-style '(face lines-tail trailing tabs empty))


;;; --------------------------------------------------------------------
;;; Modes via use-package
;;; --------------------------------------------------------------------

(use-package yaml-mode)
(use-package markdown-mode)
(use-package json-mode)
(use-package terraform-mode
  :hook (terraform-mode . terraform-format-on-save-mode))

(use-package web-mode
  :mode ("\\.html?\\'"
         "\\.phtml\\'"
         "\\.tpl\\.php\\'"
         "\\.[agj]sp\\'"
         "\\.as[cp]x\\'"
         "\\.erb\\'"
         "\\.mustache\\'"
         "\\.djhtml\\'")
  :config
  (setq web-mode-enable-engine-detection t
        web-mode-enable-sql-detection t))

;; TOFIX (use-package browse-yank)
(use-package edit-server
  :config
  (edit-server-start))
(use-package regex-tool)
(use-package sql-indent
  :hook (sql-mode . sqlind-minor-mode))


;;; --------------------------------------------------------------------
;;; Python Defaults
;;; --------------------------------------------------------------------

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")


;;; --------------------------------------------------------------------
;;; Disable eldoc globally
;;; --------------------------------------------------------------------

(global-eldoc-mode -1)



;;; ====================================================================
;;;  INTEGRATED FUNCTIONALITY — jlp.el
;;; ====================================================================

;;; --------------------------------------------------------------------
;;; Text-mode Behavior
;;; --------------------------------------------------------------------

(defun jlp-text-mode-setup ()
  "Use visual-line for markdown, auto-fill elsewhere."
  (if (memq major-mode '(gfm-mode markdown-mode))
      (visual-line-mode 1)
    (auto-fill-mode 1)))

(add-hook 'text-mode-hook #'jlp-text-mode-setup)
(setq-default case-fold-search t)


;;; --------------------------------------------------------------------
;;; Editor Behavior from jlp.el
;;; --------------------------------------------------------------------

(setq enable-recursive-minibuffers t
      track-eol nil
      list-directory-brief-switches "-aCF"
      list-directory-verbose-switches "-al"
      make-backup-files nil
      require-final-newline t
      scroll-step 1
      scroll-conservatively 60
      delete-old-versions t
      visible-bell t)


;;; --------------------------------------------------------------------
;;; Auto-Mode Additions
;;; --------------------------------------------------------------------

(add-to-list 'auto-mode-alist '("\\.crypt\\'" . text-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'"    . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rst\\'"   . rst-mode))
(add-to-list 'auto-mode-alist '("\\.tf\\'"    . terraform-mode))


;;; --------------------------------------------------------------------
;;; Uniquify
;;; --------------------------------------------------------------------

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-ignore-buffers-re "^\\*")


;;; --------------------------------------------------------------------
;;; Whitespace + Untabify Helper
;;; --------------------------------------------------------------------

(defun jlp-strip-trailing-and-untabify ()
  "Delete trailing whitespace and untabify entire buffer."
  (delete-trailing-whitespace)
  (save-excursion
    (untabify (point-min) (point-max))))


;;; --------------------------------------------------------------------
;;; C-mode
;;; --------------------------------------------------------------------

(defun jlp-c-mode-hook ()
  (setq c-auto-newline nil
        c-tab-always-indent nil
        case-fold-search nil))
(add-hook 'c-mode-hook #'jlp-c-mode-hook)


;;; --------------------------------------------------------------------
;;; C block comment customization (modern replacement for c-comment.el)
;;; --------------------------------------------------------------------

(defcustom jlp-c-comment-starting-blank t
  "If non-nil, start C block comments with an initial blank line
between `/*` and the first ` * ` line (K&R \"extra-line\" style)."
  :type 'boolean
  :group 'comment)

(defcustom jlp-c-comment-indenting t
  "If non-nil, keep interior indentation across new comment lines."
  :type 'boolean
  :group 'comment)

(defcustom jlp-c-comment-hanging-indent t
  "If non-nil, align subsequent lines after a dash in the first line
of a C block comment."
  :type 'boolean
  :group 'comment)

(with-eval-after-load 'cc-mode
  (defun jlp-c-comments-setup ()
    "Configure modern C/CC-mode block comment behavior."
    (setq-local
     comment-start "/* "
     comment-end   " */"
     comment-continue " * "
     comment-style
     (if jlp-c-comment-starting-blank 'extra-line 'multi-line)
     comment-auto-fill-only-comments t)

    (when jlp-c-comment-indenting
      (auto-fill-mode 1)))

  (add-hook 'c-mode-common-hook #'jlp-c-comments-setup))


(defun jlp-c-insert-block-comment (&optional hanging)
  "Insert a K&R-style C block comment at point and prepare filling.
With prefix argument HANGING (C-u), force hanging indent after a dash."
  (interactive "P")
  (let* ((col (current-indentation))
         (base (concat (make-string col ?\s) " * "))
         (style (if jlp-c-comment-starting-blank
                    'extra-line 'multi-line)))
    ;; Ensure local comment settings
    (setq-local
     comment-style style
     comment-start "/* "
     comment-end   " */"
     comment-continue " * "
     comment-auto-fill-only-comments t)

    (auto-fill-mode 1)
    (c-indent-line)

    ;; Insert skeleton
    (if (eq style 'extra-line)
        (progn
          (insert "/*\n" base)
          (save-excursion
            (insert "\n" (make-string col ?\s) " */")))
      (insert "/* ")
      (save-excursion
        (insert " */")))

    ;; Default fill prefix
    (setq-local fill-prefix base)

    ;; Optional hanging indent after \" - \"
    (when (or hanging jlp-c-comment-hanging-indent)
      (save-excursion
        (let ((bol (line-beginning-position))
              (eol (line-end-position)))
          (when (save-excursion
                  (goto-char bol)
                  (search-forward " - " eol t))
            (goto-char bol)
            (search-forward " - ")
            (let* ((target-col (current-column))
                   (base-col (+ col 3))
                   (extra (max 0 (- target-col base-col))))
              (setq-local
               fill-prefix
               (concat base (make-string extra ?\s))))))))

    ;; Land point where typing begins
    (when (eq style 'extra-line)
      (end-of-line))))

(with-eval-after-load 'cc-mode
  (define-key c-mode-base-map (kbd "C-c *")
	      #'jlp-c-insert-block-comment))

;;; --------------------------------------------------------------------
;;; Perl / cperl-mode
;;; --------------------------------------------------------------------

(defun jlp-cperl-mode-hook ()
  (setq tab-width 4
        indent-tabs-mode nil
        cperl-tab-always-indent nil
        cperl-indent-left-aligned-comments t
        cperl-indent-level 2
        cperl-continued-statement-offset 2
        cperl-continued-brace-offset 2
        cperl-brace-offset 0
        cperl-brace-imaginary-offset 0
        cperl-label-offset -1
        cperl-min-label-indent 1)
  (add-hook 'before-save-hook #'jlp-strip-trailing-and-untabify nil t)
  (whitespace-mode 1))
(add-hook 'cperl-mode-hook #'jlp-cperl-mode-hook)


;;; --------------------------------------------------------------------
;;; Python
;;; --------------------------------------------------------------------

(defun jlp-python-mode-hook ()
  (add-hook 'before-save-hook #'jlp-strip-trailing-and-untabify nil t)
  (whitespace-mode 1))
(add-hook 'python-mode-hook #'jlp-python-mode-hook)

(use-package pyenv-mode
  :config
  (pyenv-mode))


;;; --------------------------------------------------------------------
;;; Makefiles
;;; --------------------------------------------------------------------

(defun jlp-makefile-mode-hook ()
  (setq-local whitespace-style '(face lines-tail trailing empty tabs-mark)))
(add-hook 'makefile-mode-hook #'jlp-makefile-mode-hook)


;;; --------------------------------------------------------------------
;;; HTML helper face (legacy)
;;; --------------------------------------------------------------------

(defface jlp-deemphasized
  '((t :foreground "grey40"))
  "Deemphasized HTML face.")

(add-hook 'html-mode-hook #'turn-on-auto-fill)



;;; ====================================================================
;;;  INTEGRATED FUNCTIONALITY — misc-funs.el
;;; ====================================================================

(defun jlp-open-line-above () (interactive)
  (beginning-of-line) (open-line 1))

(defun jlp-at-top () (interactive) (recenter 0))

(defun jlp-up-one ()   (interactive) (scroll-up 1))
(defun jlp-down-one () (interactive) (scroll-down 1))

(defun jlp-insert-function-tag (tag)
  (beginning-of-line)
  (insert
   "\n/****************************************************************\n"
   " * TAG( " tag " )\n"
   " *\n"
   " *\n"
   " */\n"))

(defun jlp-tag-function (name)
  (interactive
   (let* ((default (find-tag-default))
          (spec (read-string
                 (if default
                     (format "Function name (default %s): " default)
                   "Function name: "))))
     (list (if (equal spec "") default spec))))
  (require 'tags)
  (jlp-insert-function-tag name))

(defun jlp-insert-cut-line ()
  (interactive)
  (insert "------------------------------ cut here ------------------------------"))

(defun jlp-x-stuff ()
  "Insert current X/GUI selection."
  (interactive)
  (let ((sel (gui-get-selection)))
    (when sel (insert sel))))

(defun jlp-copy-overlay (o)
  "Return a deep copy of overlay O."
  (let ((new (make-overlay (overlay-start o) (overlay-end o)
                           (overlay-buffer o)))
        (props (overlay-properties o)))
    (while props
      (overlay-put new (pop props) (pop props)))
    new))

(defun jlp-remove-overlays (&optional beg end name val)
  "Remove overlays matching NAME VAL but preserve partial overlaps."
  (unless beg (setq beg (point-min)))
  (unless end (setq end (point-max)))
  (overlay-recenter end)
  (when (< end beg)
    (setq beg (prog1 end (setq end beg))))
  (save-excursion
    (dolist (o (overlays-in beg end))
      (when (eq (overlay-get o name) val)
        (cond
         ((< (overlay-start o) beg)
          (if (> (overlay-end o) end)
              (progn
                (move-overlay (jlp-copy-overlay o)
                              (overlay-start o) beg)
                (move-overlay o end (overlay-end o)))
            (move-overlay o (overlay-start o) beg)))
         ((> (overlay-end o) end)
          (move-overlay o end (overlay-end o)))
         (t
          (delete-overlay o)))))))

(defun jlp-ediff-buffer-against-file (file)
  "Ediff current buffer with FILE."
  (interactive
   (list (ediff-read-file-name
          "Compare with file: " default-directory buffer-file-name)))
  (let ((buf (current-buffer))
        (tmp (create-file-buffer file)))
    (with-current-buffer tmp
      (insert-file-contents file t nil nil t))
    (ediff-buffers buf tmp)))



;;; ====================================================================
;;;  MODERNIZED match-it (with attribution)
;;; ====================================================================
;;; based on a file posted to gnu.emacs on 9 MAR 89 17:41:42 GMT
;;; by mrspoc!kayvan@apple.com

(defun jlp-match-it ()
  "Match delimiter at point (like vi '%')."
  (interactive)
  (let ((syntax (char-syntax (char-after))))
    (cond
     ((eq syntax ?\() (jlp-match-it-forward))
     ((eq syntax ?\)) (jlp-match-it-backward))
     (t (user-error "%c is not a bracket" (char-after))))))

(defun jlp-matching-char (char table)
  "Return matching delimiter for CHAR using syntax TABLE."
  (when (and (syntax-table-p table) (characterp char))
    (let* ((desc (aref table char))
           (match (lsh desc -8)))
      (when (> match 0) match))))

(defun jlp--goto-and-error (pos err)
  (goto-char pos)
  (user-error "%s" err))

(defun jlp-match-it-forward ()
  "Find matching close delimiter."
  (let* ((table (syntax-table))
         (pos (point))
         (open (char-after))
         (close (jlp-matching-char open table)))
    (unless close
      (jlp--goto-and-error pos "No matching delimiter"))
    (forward-sexp 1)
    (backward-char)
    (unless (eq (char-after) close)
      (jlp--goto-and-error pos "Delimiter mismatch"))))

(defun jlp-match-it-backward ()
  "Find matching open delimiter."
  (let* ((table (syntax-table))
         (pos (point))
         (close (char-after))
         (open (jlp-matching-char close table)))
    (unless open
      (jlp--goto-and-error pos "No matching delimiter"))
    (forward-char)
    (backward-sexp 1)
    (unless (eq (char-after) open)
      (jlp--goto-and-error pos "Delimiter mismatch"))))



;;; ====================================================================
;;;  Keybindings — modernized from my-bindings.el
;;; ====================================================================

(global-set-key (kbd "M-B")           #'balance-windows)
(define-key emacs-lisp-mode-map (kbd "C-x x") #'edebug-defun)
(global-set-key (kbd "C-x %")         #'jlp-match-it)
(global-set-key (kbd "M-g")           #'goto-line)
(global-set-key (kbd "C-x ;")         #'kill-comment)
(global-set-key (kbd "C-x C-b")       #'buffer-menu)
(global-set-key (kbd "C-x C-e")       #'compile)
(global-set-key (kbd "C-x C-n")       #'next-error)
(global-set-key (kbd "C-x C-k")       #'kill-compilation)

;; Outline minor mode map
(define-prefix-command 'cm-map nil "Outline-")
(define-key cm-map (kbd "q") #'hide-sublevels)
(define-key cm-map (kbd "t") #'hide-body)
(define-key cm-map (kbd "o") #'hide-other)
(define-key cm-map (kbd "c") #'hide-entry)
(define-key cm-map (kbd "l") #'hide-leaves)
(define-key cm-map (kbd "d") #'hide-subtree)
(define-key cm-map (kbd "a") #'show-all)
(define-key cm-map (kbd "e") #'show-entry)
(define-key cm-map (kbd "i") #'show-children)
(define-key cm-map (kbd "k") #'show-branches)
(define-key cm-map (kbd "s") #'show-subtree)
(define-key cm-map (kbd "u") #'outline-up-heading)
(define-key cm-map (kbd "n") #'outline-next-visible-heading)
(define-key cm-map (kbd "p") #'outline-previous-visible-heading)
(define-key cm-map (kbd "f") #'outline-forward-same-level)
(define-key cm-map (kbd "b") #'outline-backward-same-level)
(global-set-key (kbd "M-o") cm-map)

;;; ------------------------------------------------------------------
;;; Modernized auto-loads (from legacy auto-loads.el)
;;; ------------------------------------------------------------------

;; hexl-mode (binary editor)
(autoload 'hexl-find-file "hexl" "Edit a file in hexl-mode." t)

;; All other autoloads removed due to:
;; - obsolete packages
;; - unmaintained files
;; - replaced by modern built-ins or use-package


;;; ====================================================================
;;;  Final Startup
;;; ====================================================================

(setq inhibit-startup-message t)
(garbage-collect)

;;; ====================================================================
;;; End of unified .emacs
;;; ====================================================================


;; --- Emacs Modernization Checkpoint (Jan 2026) -------------------------
;; - Unified .emacs; removed legacy color-theme; using (use-package solarized-theme).
;; - Integrated: jlp.el, misc-funs.el, match-it (modernized + attribution).
;; - Added: jlp-c-insert-block-comment + C-c * binding (CC-mode).
;; - Switched YAML/WEB/SQL modes to MELPA/ELPA; python uses built-in + ipython.
;; - Cleansed autoloads; removed gnus/mailcrypt/old html-helper/icicles/etc.
;; Next up: replace full-ack → consider rg.el (ripgrep) with C-c s prefix.
;; -----------------------------------------------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
