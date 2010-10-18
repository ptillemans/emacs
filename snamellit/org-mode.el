
(add-to-list 'load-path "~/.emacs.d/vendor/org-mode/lisp" "~/.emacs.d/vendor/org-mode/contrib/lisp")
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(require 'org-install)

(org-mobile-pull)

(setq org-default-notes-file (concat org-directory "~/org/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
