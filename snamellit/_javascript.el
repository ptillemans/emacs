; js3
(vendor 'js3-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

; js-shell
(autoload 'javascript-shell "javascript-mode" nil t)

(defun js3-insert-console ()
  (interactive)
  (insert "console.log()")
  (backward-char))

(defun js3-execute-buffer ()
  (interactive)
  (shell-command (concat "johnson " (buffer-file-name))))

(defun js3-execute-line ()
  (interactive)
  (save-excursion
    (call-process-region (point-at-bol)
                         (point-at-eol)
                         "johnson"
                         nil
                         (get-buffer-create "*johnson-line*"))
    (with-current-buffer (get-buffer "*johnson-line*")
      (search-backward "\n\n" nil t)
      (replace-match "" nil t)
      (message (buffer-string))
      (kill-buffer nil))))

(define-key js3-mode-map (kbd "C-c t") 'js3-hide-test-functions)

;; js2-mode steals TAB, let's steal it back for yasnippet
(defun js3-tab-properly ()
  (interactive)
  (let ((yas-fallback-behavior 'return-nil))
    (unless (yas-expand)
      (indent-for-tab-command)
      (if (looking-back "^\s*")
          (back-to-indentation)))))


(add-hook 'js3-mode-hook
          '(lambda ()
             (add-hook 'before-save-hook 'delete-trailing-whitespace)
             (define-key js3-mode-map (kbd "A-r") 'js3-execute-buffer)
             (define-key js3-mode-map (kbd "A-R") 'js3-execute-line)
             (define-key js3-mode-map "\C-L" 'js3-insert-console)
             (define-key js3-mode-map (kbd "TAB") 'js3-tab-properly)
             (yas-minor-mode t)
             ))

(add-hook 'js3-mode-hook 'progmodes-hooks)
