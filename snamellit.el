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
(load "snamellit/git")
(load "snamellit/coffee")
(load "snamellit/org-mode")
(load "snamellit/slime")
(load "snamellit/yasnippet-bundle")

(when (file-exists-p "snamellit/private")
  (load "snamellit/private"))

(vendor 'ack)
(vendor 'cheat)
(vendor 'magit)
(vendor 'gist)
(vendor 'growl)
;; (vendor 'twittering-mode)
(vendor 'textile-mode)
(vendor 'yaml-mode)
(vendor 'tpl-mode)
(vendor 'open-file-in-github)
(vendor 'ooc-mode)
(vendor 'coffee-mode)
(vendor 'clojure-mode)
(vendor 'xml-rpc)
(vendor 'org2blog)


(setq yas/root-directory "~/.emacs.d/snamellit/snippets")
(yas/load-directory yas/root-directory)

; custom place to save customizations
(setq custom-file "~/.emacs.d/snamellit/custom.el")
(when (file-exists-p custom-file) (load custom-file))

