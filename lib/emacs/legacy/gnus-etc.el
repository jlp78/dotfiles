;(defun my-gnus-init ()
;  (setq nntp-prepare-server-hook 'my-nntp-proxy-xmission))
;(add-hook 'gnus-open-server-hook 'my-gnus-init)

;(setq gnus-secondary-select-methods '((nnmh "")))
;(setq nnmail-split-methods
;      '(("inbox" "^\\([Tt][Oo]\\|[Cc][Cc]\\):.*jlp")
;	("mail.other" "")))

(setq gnus-auto-mail-to-author 'ask)
(setq gnus-check-new-newsgroups 'ask-server)
(setq gnus-default-article-saver 'gnus-summary-save-in-folder)
(setq gnus-expert-user t)
;(setq gnus-fetch-old-headers 'some)
(setq gnus-fetch-old-headers nil)
(setq gnus-group-default-list-level 3)
(setq gnus-group-use-permanent-levels t)
;(setq gnus-group-sort-function 'gnus-sort-by-alphabet)
(setq gnus-kill-file-directory "~/gnus/")
(setq gnus-mail-forward-method 'gnus-mail-forward-using-mail)
(setq gnus-mail-other-window-method 'gnus-mail-other-window-using-mail)
(setq gnus-mail-reply-method 'gnus-mail-reply-using-mail)
(setq gnus-mode-non-string-length nil)
(setq gnus-read-active-file t)
(setq gnus-save-killed-list nil)
(setq gnus-subscribe-newsgroup-method 'gnus-subscribe-randomly)
(setq gnus-subscribe-options-newsgroup-method 'gnus-subscribe-randomly)
(setq gnus-summary-gather-subject-limit 'fuzzy)
(setq gnus-summary-line-format "%U%R%z%(%[%4L:%I%-20,20n%]%) %s
")
(setq gnus-summary-make-false-root 'none)
(setq gnus-thread-indent-level 2)
(setq gnus-thread-sort-functions
      (list 'gnus-thread-sort-by-date 'gnus-thread-sort-by-subject))

;(setq gnus-nntp-server "nntp.math.byu.edu")
;(setq gnus-select-method '(nntp "itchy.itsnet.com"))
;(setq gnus-select-method '(nntp "localhost" 20111))
;(setq gnus-select-method '(nntp "news.cc.utah.edu"))
(setq gnus-local-organization "PartNET")
(setq gnus-use-generic-from t)
(setq gnus-large-newsgroup 200)
(setq gnus-author-copy "|/usr/local/nmh/lib/rcvstore -create +outbox/postings")
(setq gnus-use-long-file-name t)
(setq gnus-novice-user nil)
(setq gnus-interactive-catchup nil)
(setq gnus-interactive-post nil)
(setq gnus-interactive-exit nil)
(setq gnus-article-save-directory "~/gnus/")
(setq gnus-auto-select-first nil)
(setq gnus-auto-select-next nil)
(setq gnus-auto-center-summary t)
(setq gnus-digest-separator "^Subject:[ \t]|^-----------*$")
(setq gnus-uu-begin-string "^begin[ \t]+[0-7]?[0-7][0-7][0-7][ \t]+\\(.*\\)$")

(setq gnus-folder-prefix "gnus/")
(load "gnus-mh" nil t)			; force load so we can override
(defun gnus-folder-save-name (newsgroup headers &optional last-folder)
  "Generate folder name from NEWSGROUP, HEADERS, and optional LAST-FOLDER.
If variable `gnus-use-long-file-name' is nil, it is +news.group.
Otherwise, it is like +news/group."
  (or last-folder
      (concat "+"
	      (if gnus-folder-prefix
		  gnus-folder-prefix
		"")
	      (if gnus-use-long-file-name
		  newsgroup
		(gnus-newsgroup-directory-form newsgroup)))))
(setq nnmh-directory "~/.Mail/")
(define-key gnus-summary-mode-map "\C-i" 'gnus-summary-next-thread)

(defun my-nntp-open-rlogin (server)
  (let ((proc (if nntp-rlogin-user-name
		  (start-process "nntpd" nntp-server-buffer "rsh" server
				 "-l" nntp-rlogin-user-name)
		(start-process "nntpd" nntp-server-buffer "rsh" server))))
    (process-send-string proc (mapconcat 'identity nntp-rlogin-parameters
                                         " "))
    (process-send-string proc "\n")))

(setq xmission-open-count 0)
(defun my-nntp-proxy-xmission ()
  (save-excursion
    (set-buffer (generate-new-buffer (generate-new-buffer-name "*xmission rsh*")))
    (setq xmission-buffer (current-buffer))
    (start-process "*xmission rlogin*" xmission-buffer "/usr/local/bin/ssh"
			     "xmission.com" "perl" "t/p1"))
  (setq xmission-open-count (+ xmission-open-count 1)))
(defun my-new-nntp-proxy-xmission ()
  (save-excursion
    (set-buffer (generate-new-buffer (generate-new-buffer-name "*xmission ssh*")))
    (setq xmission-ssh-buffer (current-buffer))
    (start-process "*xmission ssh*" xmission-ssh-buffer "/usr/local/bin/ssh"
		   "-n" "-x" "-c" "rc4" "-n" "-L" "20415:news.xmission.com:119"
		   "xmission.com" "sleep" "36000")))

(defun do-gnus ()
  (interactive)
;  (my-nntp-proxy-xmission)
  (my-new-nntp-proxy-xmission)
  (gnus))
  
