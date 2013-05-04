(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)

(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))


(defun my-markdown-tab ()
  (interactive)
  (let ((yas-fallback-behavior 'return-nil)) (yas-expand))
  (markdown-cycle))

(add-hook
 'markdown-mode-hook
 '(lambda ()
    (define-key markdown-mode-map (kbd "A-r") 'markdown-preview)
    (define-key markdown-mode-map (kbd "<tab>") 'my-markdown-tab)
    (outline-minor-mode)))
