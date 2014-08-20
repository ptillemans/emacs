
(when (file-exists-p ".passwords") (load ".passwords"))

(load "defuns")
(load "global")
(load "bindings")
(load "modes")
(load "theme")

(print "Loading settings done.")

(when (file-exists-p "private")
  (load "private"))


; custom place to save customizations
(setq custom-file "~/.emacs.d/snamellit/custom.el")
(when (file-exists-p custom-file) (load custom-file))
(print "Customization done")
