
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
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(setq ido-enable-flex-matching t)

(eval-after-load "flx-ido"
  '(progn
     (flx-ido-mode 1)
     ;; disable ido faces to see flx highlights.
     (setq ido-use-faces nil)))

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

(defvar my-packages
  '(
    ack-and-a-half
    ac-nrepl
    auctex
    alert
    auto-complete
    auto-complete-pcmp
    cider         ;; clojure ide for emacs
    cl-lib
    clojure-mode
    coffee-mode
    creole
    dash
    db
    deferred
    edit-server
    elnode
    epl
    ess
    ess-smart-underscore
    expand-region
    fakir               ;; faking bits of emacs
    feature-mode
    findr
    flx-ido
    gntp
    helm
    gh
    gist
    gntp
    git-commit-mode
    git-gutter
    git-rebase-mode
    groovy-mode
    haskell-mode
    inf-ruby
    inflections
    jump
    kv
    log4j-mode
    log4e
    logito
    magit
    markdown-mode
    metaweblog
    multiple-cursors
    noflet
    nose                ;; easy python test
    org
    org-ac
    org-gcal
    org-jira
;    org-mobile-sync    ;; requires emacs 24.3.50
    org-pandoc
    org-pomodoro
    org2blog
    paredit
    pcache
    pkg-info
    popup
    projectile          ;; navigate and manage projects
    rainbow-mode
    request
    request-deferred
    rinari
    rspec-mode
    ruby-additional
    ruby-compilation
    ruby-electric
    ruby-refactor
    ruby-test-mode
    rvm
    s
    scala-mode
    scss-mode
    solarized-theme
    web
    yasnippet
    yaxception
    xml-rpc
    zenburn-theme
    ))

(defun my-packages-installed-p (packages)
  "Check if all packages mentioned in the my-packages list are installed"
  (loop for p in packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(package-initialize)
(setq package-enable-at-startup nil)

;; skip this if all packages are already installed
(unless (my-packages-installed-p my-packages)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
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


; Load el4r, which loads Xiki
;(rvm-use "1.9.3" "")
;(add-to-list 'load-path "/Users/pti/.rvm/gems/ruby-1.9.3-p547/gems/trogdoro-el4r-1.0.10/data/emacs/site-lisp/")
;(require 'el4r)
;(el4r-boot)
                                        ;(el4r-troubleshooting-keys)

;; garbage collection tuning
(setq gc-cons-threshold 20000000)  ;; 20Mb instead of 800k
