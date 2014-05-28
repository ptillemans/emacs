
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
;; (server-start)

;; lose UI stuff
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Missing function in git emacs
(defun plist-to-alist (p)
  (if (empty? p)
    p
    (let (( c (cons (car p) (cadr p))))
      (cons c (plist-to-alist (cddr p)))
      )))

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

;; when opening à file return To last cursor position
(require 'saveplace)
(setq-default save-place t)

;; enable marmalade package repository
(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(defvar my-packages
  '(ack-and-a-half
    ac-nrepl
    auctex
    auto-complete
    caml
    cl-lib
    clojure-mode
    clojure-test-mode
    coffee-mode
    evernote-mode
    ess
    ess-smart-underscore
    expand-region
    elnode
    feature-mode
    helm
    gist
    git-gutter
    groovy-mode
    haskell-mode
    inf-ruby
    magit
    magithub
    markdown-mode
    multiple-cursors
    nrepl
    paredit
    projectile
    python
    sass-mode
    rainbow-mode
    scala-mode
    solarized-theme
    volatile-highlights
    yaml-mode
    yari
    yasnippet
    zenburn-theme
       )
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  "Check if all packages mentioned in the my-packages list are installed"
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; skip this if all packages are already installed
(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

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
  (add-hook 'before-save-hook 'progmodes-write-hooks))

(defun progmodes-write-hooks ()
  "Hooks which run on file write for programming modes"
  (prog1 nil
    (set-buffer-file-coding-system 'utf-8-unix)
    (untabify-buffer)))


(add-hook 'gams-mode-hook 'progmodes-hooks)
(add-hook 'ess-mode-hook 'progmodes-hooks)

(server-start)
