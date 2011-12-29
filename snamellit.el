
(defun extend-exec-path (s)
  (setenv "PATH" (concat (getenv "PATH") (concat ":" s)))
  (setq exec-path (append exec-path (list s))))

(extend-exec-path "/usr/local/bin")


(add-to-list 'load-path "~/.emacs.d/vendor")


(when (file-exists-p ".passwords") (load ".passwords"))

(load "snamellit/lisp")
(load "snamellit/global")
(load "snamellit/defuns")
(load "snamellit/bindings")
(load "snamellit/modes")
(load "snamellit/theme")
(load "snamellit/temp_files")
(load "snamellit/github")
(load "snamellit/coffee")
(load "snamellit/yasnippet-bundle")
(load "snamellit/org-mode")
(load "snamellit/groovy")
(load "snamellit/gnus")

(when (file-exists-p "snamellit/private")
  (load "snamellit/private"))

(vendor 'ack)
(vendor 'cheat)
(vendor 'magit)
(vendor 'growl)
(vendor 'twittering-mode)
(vendor 'textile-mode)
(vendor 'yaml-mode)
(vendor 'tpl-mode)
(vendor 'open-file-in-github)
(vendor 'coffee-mode)
(vendor 'clojure-mode)
(vendor 'xml-rpc)
(vendor 'org2blog)
(vendor 'feature-mode)
(vendor 'gist.el)

(setq yas/root-directory "~/.emacs.d/snamellit/snippets")
(yas/load-directory yas/root-directory)

; custom place to save customizations
(setq custom-file "~/.emacs.d/snamellit/custom.el")
(when (file-exists-p custom-file) (load custom-file))

