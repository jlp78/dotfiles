;From: jr@bbn.com (John Robinson)
;Newsgroups: gnu.emacs
;Subject: Re: Emacs window splitting challange!
;Date: 16 Mar 89 07:49:19 GMT
;Reply-To: jr@bbn.com (John Robinson)
;Organization: BBN Systems and Technologies Corporation, Cambridge MA
;In-reply-to: fox@cs.cs.columbia.edu (David Fox)

;In article <FOX.89Mar9164818@cs.cs.columbia.edu>, fox@cs (David Fox) writes:
;>Can anyone write a function to split a window in two such that
;>the displayed text does not change?

;This turned out to be subtler than at first blush.  But an hour or two
;of hacking refined it to the following.  I'm gonna make this my
;standard ^X 2, even for fast devices!
;--------
; slowsplit.el
;; Response to a challenge to build a split-window with minimum redisplay.
;; In the interests of really doing this, it may move point (the case where
;; the new modeline would cover point).  Replacement for
;; split-window-vertically.
;; John Robinson, <jr@bbn.com>, 16 Mar 89

(defun split-window-quietly (&optional arg)
  "Split the window vertically with minimum redisplay.
This window becomes the uppermost of the two, and gets
ARG lines.  No arg means split equally."
  (interactive "P")
  (let* ((oldpt (point))		;where cursor started
	 (oldstart (window-start))	;first character in window
	 (num-arg (and arg (prefix-numeric-value arg)))	;arg if any
	 (above (count-lines (point-min) oldstart)) ;lines above window
	 (curr (+ above (count-lines oldstart ;lineno of point
				     (save-excursion
				       (beginning-of-line)
				       (point)))))
	 (scroll (+ 1 above		;line below split point
		    (or num-arg (/ (window-height) 2))))
	 (linect (+ 1 above (count-lines oldstart ;last point in window
				       (save-excursion
					 (move-to-window-line -1)
					 (point))))))
    (split-window nil num-arg)		;split the window
    (if (< (+ 2 curr) scroll)		;old point is in upper window
	(progn
	  (other-window 1)
	  (goto-line (min linect scroll)) ;reposition lower window
	  (recenter 0)
	  (other-window -1))		;and return to upper one
      (goto-char oldstart)		;reposition upper window
      (recenter 0)
      (other-window 1)
      (goto-line scroll)		;and lower window
      (recenter 0)
      (if (/= (+ 2 curr) scroll)	;unless modeline covers old point
	  (goto-char oldpt)		;move to point, in lower window
	(move-to-window-line 0)))))
;--------
;/jr
;jr@bbn.com or bbn!jr
;C'mon big money!

