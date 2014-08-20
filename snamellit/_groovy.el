;; Load editing help
(autoload 'groovy-mode "groovy-mode"
  "Mode for editing groovy source files" t)
(setq auto-mode-alist
      (append '(("\\.groovy$" . groovy-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("groovy" . groovy-mode))
				     interpreter-mode-alist))

;; set to load inf-groovy and set inf-groovy key definition in groovy-mode.
(autoload 'run-groovy "inf-groovy" "Run an inferior Groovy process")
(autoload 'inf-groovy-keys "inf-groovy" "Set local key defs for inf-groovy in groovy-mode")

(add-hook 'groovy-mode-hook
      '(lambda ()
         (inf-groovy-keys)
))

(add-hook 'groovy-mode-hook 'progmodes-hooks)

;; can set groovy-home here, if not in environment
(setq inferior-groovy-mode-hook
    '(lambda()
       (setq groovy-home "/Users/pti/Tools/groovy")
       ))
