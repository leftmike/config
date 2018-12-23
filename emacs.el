(add-to-list 'load-path "~/config/lisp")
(require 'whitespace)
(require 'go-mode-autoloads)
(require 'desktop)

(setq gofmt-command "~/go/bin/goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(global-whitespace-mode)
;(setq whitespace-style '(face tab tab-mark trailing))
(setq whitespace-style '(face trailing))
;(setq show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)
(setq next-line-add-newlines nil)
(setq scroll-step 1)
(setq auto-save-default nil)
(setq column-number-mode t)
(setq make-backup-files nil)
(setq visible-bell 1)
(setq line-number-mode t)
(setq transient-mark-mode t)
(setq show-paren-style (quote mixed))
(setq require-final-newline nil)
(setq default-fill-column 79)
(setq compile-command "make")
(show-paren-mode 1)
(setq-default tab-width 4)
(setq confirm-kill-emacs 'y-or-n-p)
(desktop-save-mode 1)

(defun soft-kill-line (&optional arg)
  "Kill the rest of the current line; otherwise like kill-line."
  (interactive "P")
  (kill-region (point)
	       (progn
		 (if arg
		     (forward-visible-line (prefix-numeric-value arg))
		   (if (eobp)
		       (signal 'end-of-buffer nil))
		   (let ((end
			  (save-excursion
			    (end-of-visible-line) (point))))
		     (if (or (= (point) end)
			     (and kill-whole-line (bolp)))
			 (forward-visible-line 1)
		       (goto-char end))))
		 (point))))

(global-set-key (kbd "C-k") 'soft-kill-line)
(define-key global-map (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-x C-y") 'clipboard-yank)
(global-set-key (kbd "C-x M-w") 'clipboard-kill-ring-save)

(setq-default c-electric-flag nil)
(setq c-basic-offset 4)

(defadvice show-paren-function
      (after show-matching-paren-offscreen activate)
      "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
      (interactive)
      (let* ((cb (char-before (point)))
             (matching-text (and cb
                                 (char-equal (char-syntax cb) ?\) )
                                 (blink-matching-open))))
        (when matching-text (message matching-text))))
