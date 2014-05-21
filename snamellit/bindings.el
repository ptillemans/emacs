; general
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\C-c\C-g" 'gist-buffer-confirm)
(global-set-key "\C-xg" 'magit-status)
(global-set-key "\C-R" 'replace-string)

;; no printing!
;; no changing meta key!!
(when (boundp 'osx-key-mode-map)
  ;; Option is my meta key.
  (define-key osx-key-mode-map (kbd "A-;")
    '(lambda () (interactive) (message "noop")))

  ;; What's paper?
  (define-key osx-key-mode-map (kbd "A-p")
    '(lambda () (interactive) (message "noop"))))

; no mailing!
(global-unset-key (kbd "C-x m"))
(global-unset-key "\C-z")

; comment and uncomment regions
(global-set-key (kbd "C-/") 'comment-region)
(global-set-key (kbd "C-?") 'uncomment-region)

; launch mini helm
(global-set-key "\C-ch" 'helm-mini)

; expand region
(global-set-key (kbd  "C-=") 'er/expand-region)

;; Quickly jump in document with ace-jump-mode
(define-key global-map (kbd "C-`") 'ace-jump-mode)
