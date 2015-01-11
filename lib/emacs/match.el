;From: mrspoc!guinan!kayvan@APPLE.COM
;Newsgroups: gnu.emacs
;Subject: Parenthesis matching when positioned over curser
;Date: 9 Mar 89 17:41:42 GMT
;Reply-To: mrspoc!kayvan@apple.com
;Distribution: gnu
;Organization: GNUs Not Usenet

;Here's my contribution to this. It's a function that matches the character
;that the cursor is on when invoked (it checks the syntax table, so it's
;general across all modes).

;In my .emacs file I have:

;(global-set-key "\C-x%" 'match-it)
;(autoload 'match-it "match" "" t)

;------------------------------ match.el ---------------------------------
; match parenthesis according to syntax tables. Like % in vi.
; matches the character following dot by jumping to matching character.
;
; By Kayvan Sylvan

(defun match-it ()
  "Match character after dot to its corresponding open or close."
  (interactive)
  (let ((syntax (char-syntax (following-char))))
    (cond ((= syntax ?\() (match-it-forward))
	  ((= syntax ?\)) (match-it-backward))
	  (t (error "%c is not an open or close." (following-char))))))

(defun matching-char (char table)
  "return the matching char of CHAR from TABLE. TABLE must be a syntax-table.
returns nil if none is found"
  (cond ((and (syntax-table-p table) (char-or-string-p char))
	 (if (stringp char) (setq char (string-to-char char)))
	 (if (> (setq char (lsh (aref table char) -8)) 0) char nil))
	(t (error "Not syntax table or bad char"))))

(defun go-error (pos err)
  "Goto position POS of file, while signalling error ERROR"
  (goto-char pos)
  (error err))

(defun match-it-forward ()
  "Find match for an open."
  (let ((table (syntax-table)) (pos (dot)))
    (setq char (matching-char (following-char) table))
    (forward-sexp 1)
    (backward-char)
    (if (not (= char (following-char))) (go-error pos "mismatch"))))

(defun match-it-backward ()
  "Find match for a close."
  (let ((table (syntax-table)) (pos (dot)))
    (setq char (matching-char (following-char) table))
    (forward-char)
    (backward-sexp 1)
    (if (not (= char (following-char))) (go-error pos "mismatch"))))

