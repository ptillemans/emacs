
(defun defunkt-ido-find-config ()
  (interactive)
  (find-file
   (concat "~/.emacs.d/snamellit/"
           (ido-completing-read "Config file: "
                                (directory-files "~/.emacs.d/snamellit/"
                                                 nil
                                                 "^[^.]")))))

(defun defunkt-ido-find-project ()
  (interactive)
  (find-file
   (concat "~/Projects/" (ido-completing-read "Project: "
                           (directory-files "~/Projects/" nil "^[^.]")))))

(defun defunkt-goto-config ()
  (interactive)
  (find-file "~/.emacs.d/snamellit.el"))

; for loading libraries in from the vendor directory
(defun vendor (library)
  (let* ((file (symbol-name library))
         (normal (concat "~/.emacs.d/vendor/" file))
         (lisp-normal (concat normal "lisp"))
         (suffix (concat normal ".el"))
         (defunkt (concat "~/.emacs.d/snamellit/" file)))
    (cond
     ; needed for org-mode
     ((file-directory-p lisp-normal) (add-to-list 'load-path lisp-normal) (require library))
    ((file-directory-p normal) (add-to-list 'load-path normal) (require library))
     ((file-directory-p suffix) (add-to-list 'load-path suffix) (require library))
     ((file-exists-p suffix) (require library)))
    (when (file-exists-p (concat defunkt ".el"))
      (load defunkt))))

(defun gist-buffer-confirm (&optional private)
  (interactive "P")
  (when (yes-or-no-p "Are you sure you want to Gist this buffer? ")
    (gist-region-or-buffer-private)))

(defun clean-slate ()
  "Kills all buffers except *scratch*"
  (interactive)
  (let ((buffers (buffer-list)) (safe '("*scratch*")))
    (while buffers
      (when (not (member (car buffers) safe))
        (kill-buffer (car buffers))
        (setq buffers (cdr buffers))))))


;; eshell extensions

(defun eshell/ggpnp ()
  (print (concat "Pulling from origin/" (magit-get-current-branch)))
  (if (magit-run-git "pull" "origin" (magit-get-current-branch))
    (magit-run-git "push" "origin" (magit-get-current-branch))))
