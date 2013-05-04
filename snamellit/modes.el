;; others
(load "snamellit/artist")
(load "snamellit/coffee")
(load "snamellit/css")
(load "snamellit/clojure-mode")
(load "snamellit/cucumber")
(load "snamellit/dired")
(load "snamellit/groovy")
(load "snamellit/javascript")
(load "snamellit/markdown")
(load "snamellit/python")
(load "snamellit/ruby")
(load "snamellit/sgml")
(load "snamellit/shell")

(load "snamellit/org-mode")
(load "snamellit/org2blog")

(load "snamellit/gnus")
(load "snamellit/rcirc")
(load "snamellit/shell")


(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; emacs
(define-key emacs-lisp-mode-map (kbd "A-r") 'eval-buffer)
;; Paredit overshadows the C-j bindings in lisp interaction mode.
(define-key lisp-interaction-mode-map [S-return] 'eval-print-last-sexp)

; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))

; magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

; paredit
(autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code."
     t)
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode +1)
            (show-paren-mode +1)))

; jasper
(setq auto-mode-alist (cons '("\\.jr" . emacs-lisp-mode) auto-mode-alist))

; yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
    '(lambda ()
       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))


; mustache
(add-to-list 'auto-mode-alist '("\\.mustache$" . tpl-mode))

;; GNUS
; make gmail the primary access
(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))

; configure to send emails
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "pti@melexis.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "melexis.com")

; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; ESS
(require 'ess-site)
