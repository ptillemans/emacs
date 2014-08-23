;; settings for rcirc IRC client

;; colorize names
;;(eval-after-load 'rcirc '(require 'rcirc-color))

;; You can autoload, but at the end of this block we'll
;; connect to two networks anyway.

;; Don't print /away messages.
;; This does not require rcirc to be loaded already,
;; since rcirc doesn't define a 301 handler (yet).
(defun rcirc-handler-301 (process cmd sender args)
  "/away message handler.")

;; Turn on spell checking.
;(add-hook 'rcirc-mode-hook (lambda ()
;			     (flyspell-mode 1)))

;; Keep input line at bottom.
(add-hook 'rcirc-mode-hook
	  (lambda ()
	    (set (make-local-variable 'scroll-conservatively)
		 8192)))


(setq rcirc-authinfo '(("freenode" nickserv "snamellit" "snowball")))
(setq rcirc-default-nick "snamellit")
(setq rcirc-default-user-name "snamellit")
(setq rcirc-default-full-name "peter tillemans")

;; Join these channels at startup.
(setq rcirc-server-alist '(("irc.freenode.net" :channels ("#emacs" "#rcirc" "#clojure" "#cucumber" "#leiningen" "#ubuntu-bugs"))))
