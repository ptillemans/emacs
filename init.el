;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-library "url-handlers")

(require 'org)
(require 'ob-tangle)

;; the standard 'org-babel-load-file cannot be used here as I use
;; tangling to generate scripts for the local bin directory. This
;; causes the name of the scripts to be returned in the car of the
;; tangle command which is used to load the file. The net result is
;; that not the initialization is loaded, but the first exported
;; script.
(let ((src "~/.emacs.d/snamellit.org")
      (tgt "~/.emacs.d/snamellit.el"))
  (if (file-newer-than-file-p src tgt)
      (progn
        (message "snamellit.org has been changed, tangling...")
        (org-babel-tangle-file src tgt "emacs-lisp")))
  (load-file tgt))

(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
