
;; enable proxy settings at melexis
(defun melexis-proxy ()
  (setq url-proxy-services '(("no_proxy" . "elex.be")
                             ("http" . "proxy:3128")
                             ("https" . "proxy:3128")))
)

(defun vendor (library)
  "Load a vendor extension.
Vendor extensions are loaded in an opinionated way. They will be
present in ~/emacs.d/vendor folder. Either downloaded or as a git
submodule.

If it is a file with .el extension, or a folder with a file with
the same basename and extension .el, then this will be placed on
the load path and executed.

If in the emacs config folder there is a file with the same name,
it is executed afterwards to configure the vendor extension."

  (let* ((file (symbol-name library))
         (normal (concat "~/.emacs.d/vendor/" file))
         (lisp-normal (concat normal "lisp"))
         (suffix (concat normal ".el"))
         (my-config (concat "~/.emacs.d/snamellit/_" file)))
    (cond
                                        ; needed for org-mode
     ((file-directory-p lisp-normal) (add-to-list 'load-path lisp-normal) (require library))
     ((file-directory-p normal) (add-to-list 'load-path normal) (require library))
     ((file-directory-p suffix) (add-to-list 'load-path suffix) (require library))
     ((file-exists-p suffix) (require library)))
    (when (file-exists-p (concat my-config ".el"))
      (load my-config))))

(defun gist-buffer-confirm (&optional private)
  "Gist a private buffer with confirmation."
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
  "EShell extension for git push and pull."
  (print (concat "Pulling from origin/" (magit-get-current-branch)))
  (if (magit-run-git "pull" "origin" (magit-get-current-branch))
      (magit-run-git "push" "origin" (magit-get-current-branch))))
