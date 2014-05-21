
;; indent after newline
(add-hook 'python-mode-hook
          '(lambda ()
             (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; add progmodes hook (see global.el)
(add-hook 'python-mode-hook 'progmodes-hooks)
