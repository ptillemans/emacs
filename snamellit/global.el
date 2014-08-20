
(eval-when-compile (require 'cl))

(setq tags-file-name ".TAGS")
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq mac-emulate-three-button-mouse nil)
(prefer-coding-system 'utf-8)
(setq gist-view-gist t)

;; use aspell for spell correction
(setq-default ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra"))

;; start emacs-server
(server-start)

;; lose UI stuff
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; fix the PATH variable
;; this makes sure the PATH variable is the same as in the terminal
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Change to $HOME
(cd "~")

;; set the temporary files in a separate folder to avoid creating junk in
;; the work directories. Autobuilds and git will be happier.
;;
;; stolen from http://github.com/febuiles/dotemacs/tree/master/temp_files.el
(defvar user-temporary-file-directory "~/.emacs-autosaves/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; configure ido mode
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(setq ido-enable-flex-matching t)

;; add some useful paths to start external apps
(defun extend-exec-path (s)
  (setenv "PATH" (concat (getenv "PATH") (concat ":" s)))
  (setq exec-path (append exec-path (list s))))

(extend-exec-path "/usr/local/bin")
(extend-exec-path "~/bin")

;; make vendor extensions visible
(add-to-list 'load-path "~/.emacs.d/vendor")

;; when opening a file return To last cursor position
(require 'saveplace)
(setq-default save-place t)

;; enable package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)

(setq package-load-list
  '(
    (ack-and-a-half t)
    (ac-nrepl t)
    ;;    (auctex t)
    (alert t)
    (auto-complete t)
    (auto-complete-pcmp t)
    (cider t)         ;; clojure ide for emacs
    (cl-lib t)
    (clojure-mode t)
    (coffee-mode t)
    (creole t)
    (dash t)
    (db t)
    (deferred t)
    (edit-server t)
    (elnode t)
    (epl t)
    (ess t)
    (ess-smart-underscore t)
    (expand-region t)
    (fakir t)               ;; faking bits of emacs
    (feature-mode t)
    (findr t)
    (gntp t)
    (helm t)
    (gh t)
    (gist t)
    (gntp t)
    (git-commit-mode t)
    (git-gutter t)
    (git-rebase-mode t)
    (groovy-mode           t)
    (haskell-mode t)
    (inf-ruby t)
    (inflections t)
    (jump t)
    (kv t)
    (log4j-mode t)
    (log4e t)
    (logito t)
    (magit t)
    (markdown-mode t)
    (metaweblog t)
    (multiple-cursors t)
    (noflet t)
    (nose t)                ;; easy python tests
    (org t)
    (org-ac t)
    (org-gcal t)
    (org-jira t)
    (org-mobile-sync t)
    (org-pandoc t)
    (org-pomodoro t)
    (org2blog t)
    (paredit t)
    (pcache t)
    (pkg-info t)
    (popup t)
    (projectile t)          ;; navigate and manage projects
    (rainbow-mode t)
    (request t)
    (request-deferred t)
    (rinari t)
    (rspec-mode t)
    (ruby-additional t)
    (ruby-compilation t)
    (ruby-electric t)
    (ruby-refactor t)
    (ruby-test-mode t)
    (s t)
    (scala-mode t)
    (scss-mode t)
    (solarized-theme t)
    (web t)
    (yasnippet t)
    (yaxception t)
    (xml-rpc t)
    (zenburn-theme t)
    ))

;; (defun my-packages-installed-p ()
;;   "Check if all packages mentioned in the my-packages list are installed"
;;   (loop for p in my-packages
;;         when (not (package-installed-p p)) do (return nil)
;;         finally (return t)))

;; ;; skip this if all packages are already installed
;; (unless (my-packages-installed-p)
;;   ;; check for new packages (package versions)
;;   (message "%s" "Emacs Prelude is now refreshing its package database...")
;;   (package-refresh-contents)
;;   (message "%s" " done.")
;;   ;; install the missing packages
;;   (dolist (p my-packages)
;;     (when (not (package-installed-p p))
;;       (package-install p))))

(setq package-enable-at-startup nil)
(package-initialize)


;; install vendor apps
(vendor 'org-jira)
(vendor 'scad)

;; untabify source code
(defun untabify-buffer ()
  "Untabify current buffer"
  (interactive)
  (untabify (point-min) (point-max)))

(defun progmodes-hooks ()
  "Hooks for programming modes"
  (yas-minor-mode-on)
  (add-hook 'before-save-hook 'progmodes-write-hooks nil 'local))

(defun progmodes-write-hooks ()
  "Hooks which run on file write for programming modes"
  (prog1 nil
    (set-buffer-file-coding-system 'utf-8-unix)
    (untabify-buffer)))


(add-hook 'gams-mode-hook 'progmodes-hooks)
(add-hook 'ess-mode-hook 'progmodes-hooks)

;; (edit-server-start)

;; disable YAS in terminals
(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)))

;; set a list of tag tables
(setq tags-table-list
      '("~/.emacs.d"))
