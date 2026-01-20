(setq load-path (append '("/usr/local/emacs/local-lisp") load-path))
(setq load-path (append '("/usr/local/emacs/lisp") load-path))

(if (eq window-system 'x)
    (progn
      (setq term-setup-hook 'my-x-setup)
      (defun my-x-setup () ; hook to run after terminal is setup
	(load "x-mouse" nil t)
	(load "fix-x-mouse" nil t)
	(message " "))))
