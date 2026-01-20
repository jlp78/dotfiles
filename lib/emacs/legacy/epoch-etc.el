; set up epoch the way I like it

(setq load-path (append load-path '("/usr/local/emacs/lisp/epoch")))

; load the epoch files
(load-library "epoch")
;(load-library "scroll")
(load-library "maintain-screen-titles")
(load-library "cute-wins")
(load-library "smk-x-mouse")
(load-library "motion")

; modify default epoch behavior
(setq epoch::buttons-modify-buffer nil)
(setq auto-raise-screen nil)
(setq epoch-mode-alist
      (list
       (cons 'plain-tex-mode (list (cons 'geometry "80x52")
				   (cons 'cursor-glyph 2)))
       (cons 'latex-mode     (list (cons 'geometry "80x52")
				   (cons 'cursor-glyph 2)))
       (cons 'c-mode         (list (cons 'geometry "80x52")
				   (cons 'cursor-glyph 2)))
       ))

(global-set-key "\C-zn" 'switch-screen)

(defun blink-matching-open ()
  "Replace version in simple.el for epoch --
Move cursor momentarily to the beginning of the sexp before point."
  (and (> (point) (1+ (point-min)))
       (/= (char-syntax (char-after (- (point) 2))) ?\\ )
       blink-matching-paren
       (let* ((oldpos (point))
              (blinkpos)
              (mismatch))
         (save-excursion
           (save-restriction
             (if blink-matching-paren-distance
                 (narrow-to-region (max (point-min)
                                        (- (point) blink-matching-paren-distance))
                                   oldpos))
             (condition-case ()
                 (setq blinkpos (scan-sexps oldpos -1))
               (error nil)))
           (and blinkpos (/= (char-syntax (char-after blinkpos))
                             ?\$)
                (setq mismatch
                      (/= (char-after (1- oldpos))
                          (logand (lsh (aref (syntax-table)
                                             (char-after blinkpos))
                                       -8)
                                  255))))
           (if mismatch (setq blinkpos nil))
           (if blinkpos
               (progn
                (goto-char blinkpos)
                (if (pos-visible-in-window-p)
                    (sit-for 3)
                  (goto-char blinkpos)
                  (message
                   "Matches %s"
                   (if (save-excursion
                         (skip-chars-backward " \t")
                         (not (bolp)))
                       (buffer-substring (progn (beginning-of-line) (point))
                                         (1+ blinkpos))
                     (buffer-substring blinkpos
                                       (progn
                                        (forward-char 1)
                                        (skip-chars-forward "\n \t")
                                        (end-of-line)
                                        (point)))))))
             (cond (mismatch
                    (message "Mismatched parentheses"))
                   ((not blink-matching-paren-distance)
                    (message "Unmatched parenthesis"))))))))

