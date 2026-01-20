; based on text-mode.el

(defvar my-mh-draft-mode-syntax-table nil
  "Syntax table used while in My MH Draft mode.")

(defvar my-mh-draft-mode-abbrev-table nil
  "Abbrev table used while in My MH Draft mode.")
(define-abbrev-table 'my-mh-draft-mode-abbrev-table ())

(if my-mh-draft-mode-syntax-table
    ()
  (setq my-mh-draft-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?\" ".   " my-mh-draft-mode-syntax-table)
  (modify-syntax-entry ?\\ ".   " my-mh-draft-mode-syntax-table)
  (modify-syntax-entry ?' "w   " my-mh-draft-mode-syntax-table))

(defvar my-mh-draft-mode-map nil
  "Keymap for My MH Draft mode.")

(if my-mh-draft-mode-map
    ()
  (setq my-mh-draft-mode-map (make-sparse-keymap))
  (define-key my-mh-draft-mode-map "\e\t" 'ispell-complete-word)
  (define-key my-mh-draft-mode-map "\t" 'tab-to-tab-stop)
  (define-key my-mh-draft-mode-map "\es" 'center-line)
  (define-key my-mh-draft-mode-map "\eS" 'center-paragraph)
  (define-key my-mh-draft-mode-map "\C-x\C-c" 'server-edit))


;(defun non-saved-my-mh-draft-mode ()
;  "Like my-mh-draft-mode, but delete auto save file when file is saved for real."
;  (my-mh-draft-mode)
;  (make-local-variable 'delete-auto-save-files)
;  (setq delete-auto-save-files t))

(defun my-mh-draft-mode ()
  "Major mode for editing text intended for humans to read.  Special commands:\\{my-mh-draft-mode-map}
Turning on My MH Draft mode calls the value of the variable `my-mh-draft-mode-hook',
if that value is non-nil."
  (interactive)
  (kill-all-local-variables)
  (use-local-map my-mh-draft-mode-map)
  (setq mode-name "My MH Draft")
  (setq major-mode 'my-mh-draft-mode)
  (setq local-abbrev-table my-mh-draft-mode-abbrev-table)
  (set-syntax-table my-mh-draft-mode-syntax-table)
  (make-local-variable 'mail-header-separator)
  (setq mail-header-separator "--------")
  (run-hooks 'my-mh-draft-mode-hook))

(defvar indented-my-mh-draft-mode-map ()
  "Keymap for Indented My MH Draft mode.
All the commands defined in My MH Draft mode are inherited unless overridden.")

(if indented-my-mh-draft-mode-map
    ()
  ;; Make different definition for TAB before the one in my-mh-draft-mode-map, but
  ;; share the rest.
  (let ((newmap (make-sparse-keymap)))
    (define-key newmap "\t" 'indent-relative)
    (setq indented-my-mh-draft-mode-map (nconc newmap my-mh-draft-mode-map))))

(defun indented-my-mh-draft-mode ()
  "Major mode for editing text with indented paragraphs.
In this mode, paragraphs are delimited only by blank lines.
You can thus get the benefit of adaptive filling
 (see the variable `adaptive-fill-mode').
\\{indented-my-mh-draft-mode-map}
Turning on `indented-my-mh-draft-mode' calls the value of the variable
`my-mh-draft-mode-hook', if that value is non-nil."
  (interactive)
  (kill-all-local-variables)
  (use-local-map my-mh-draft-mode-map)
  (define-abbrev-table 'my-mh-draft-mode-abbrev-table ())
  (setq local-abbrev-table my-mh-draft-mode-abbrev-table)
  (set-syntax-table my-mh-draft-mode-syntax-table)
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'indent-relative-maybe)
  (make-local-variable 'paragraph-start)
  (setq paragraph-start (concat "^$\\|" page-delimiter))
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)
  (use-local-map indented-my-mh-draft-mode-map)
  (setq mode-name "Indented My MH Draft")
  (setq major-mode 'indented-my-mh-draft-mode)
  (make-local-variable 'mail-header-separator)
  (setq mail-header-separator "--------")
  (run-hooks 'my-mh-draft-mode-hook))

(defun center-paragraph ()
  "Center each nonblank line in the paragraph at or after point.
See `center-line' for more info."
  (interactive)
  (save-excursion
    (forward-paragraph)
    (or (bolp) (newline 1))
    (let ((end (point)))
      (backward-paragraph)
      (center-region (point) end))))

(defun center-region (from to)
  "Center each nonblank line starting in the region.
See `center-line' for more info."
  (interactive "r")
  (if (> from to)
      (let ((tem to))
	(setq to from from tem)))
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (goto-char from)
      (while (not (eobp))
	(or (save-excursion (skip-chars-forward " \t") (eolp))
	    (center-line))
	(forward-line 1)))))

(defun center-line ()
  "Center the line point is on, within the width specified by `fill-column'.
This means adjusting the indentation so that it equals
the distance between the end of the text and `fill-column'."
  (interactive)
  (save-excursion
    (let (line-length)
      (beginning-of-line)
      (delete-horizontal-space)
      (end-of-line)
      (delete-horizontal-space)
      (setq line-length (current-column))
      (beginning-of-line)
      (indent-to 
	(+ left-margin 
	   (/ (- fill-column left-margin line-length) 2))))))

;;; my-mh-draft-mode.el ends here
