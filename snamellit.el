
(when (file-exists-p ".passwords") (load ".passwords"))

(load "snamellit/lisp")
(load "snamellit/global")
(load "snamellit/defuns")
(load "snamellit/bindings")
(load "snamellit/modes")
(load "snamellit/theme")
(load "snamellit/temp_files")

(vendor 'org-jira)

(print "Loading settings done.")

(when (file-exists-p "snamellit/private")
  (load "snamellit/private"))


; custom place to save customizations
(setq custom-file "~/.emacs.d/snamellit/custom.el")
(when (file-exists-p custom-file) (load custom-file))
(print "Customization done")
