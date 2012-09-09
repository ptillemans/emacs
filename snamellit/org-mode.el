(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org_archive$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

;; Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "S-<f12>") 'org-mobile-pullpush)
(global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> f") 'boxquote-insert-file)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> i") 'info)
(global-set-key (kbd "<f9> I") 'org-clock-in)
(global-set-key (kbd "<f9> O") 'org-clock-out)
(global-set-key (kbd "<f9> r") 'boxquote-region)
(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "C-<f10>") 'next-buffer)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "C-M-r") 'org-capture)
(global-set-key (kbd "M-<f9>") (lambda ()
                                 (interactive)
                                 (unless (buffer-modified-p)
                                   (kill-buffer (current-buffer)))
                                 (delete-frame)))


(global-font-lock-mode 1)


;; enable auto-fill-mode and spell checking
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'flyspell-mode)


;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files (quote (org-agenda-files "~/org/todo.org" "~/org/emacs.org" "~/org/pfus.org")))

;; Enable other modules

; Jira
(setq org-jira-serv-alist nil)


; Agenda
(setq org-agenda-files (quote ("~/org/" "~/org/melexis/")))

; Enable habit tracking (and a bunch of other modules)
(setq org-modules (quote (org-bbdb org-bibtex org-crypt org-gnus org-id org-info org-jsinfo org-habit org-inlinetask org-irc org-mew org-mhe org-protocol org-rmail org-vm org-wl org-w3m)))
; global STYLE property values for completion
(setq org-global-properties (quote (("STYLE_ALL" . "habit"))))
; position the habit graph on the agenda to the right of the default
(setq org-habit-graph-column 50)
; set up alert sound
(setq org-clock-sound "/usr/share/sounds/ubuntu/stereo/message-new-instant.ogg")

;; Capture setup
(setq org-default-notes-file "~/org/refile.org")

;; Archiving configuration
(setq org-archive-mark-done t)
(setq org-archive-location "%s_archive::* Archived Tasks")

;; fix acces to tab key for yasnippet
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))


;; Add support for effort etimation
(setq org-global-properties
      '(("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 6:00 8:00 16:00 24:00 32:00 40:00")))
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

(require 'cl)

;; org-mobile integration and automation.
;;
;; wait 60 min between auto updates to avoid losing time
;; when "catching up"
(setq  org-mobile-last-sync 0)

(defun open-buffer-names ()
  (mapcar 'buffer-name (buffer-list)))

(defun restore-buffers (fn)
  (let ((old-open-buffers (open-buffer-names)))
    (funcall fn)
    (dolist ( buffer-name (set-difference (open-buffer-names) old-open-buffers))
      (kill-buffer buffer-name))))

(defun org-mobile-pullpush nil nil
  ( if (> (- (float-time) org-mobile-last-sync) 3600)
     (progn
        (restore-buffers 'org-mobile-pull)
        (restore-buffers 'org-mobile-push)
        (setq org-mobile-last-sync (float-time))))
)

;; sync at start, finish and in between 2x p hr
;(add-hook 'after-init-hook (lambda () (restore-buffers 'org-mobile-pull)))
;(add-hook 'kill-emacs-hook (lambda () (restore-buffers 'org-mobile-push)))
;(run-at-time "00:29" 7200 'org-mobile-pullpush)


(setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
                                (sequence "WAITING(w@/!)" "SOMEDAY(s!)" "|" "CANCELLED(c@/!)" "PHONE")
                                (sequence "OPEN(O!)" "|" "CLOSED(C!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("SOMEDAY" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("OPEN" :foreground "blue" :weight bold)
              ("CLOSED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED"
               ("CANCELLED" . t))
              ("WAITING"
               ("WAITING" . t))
              ("SOMEDAY"
               ("WAITING" . t))
              (done
               ("WAITING"))
              ("TODO"
               ("WAITING")
               ("CANCELLED"))
              ("NEXT"
               ("WAITING"))
              ("DONE"
               ("WAITING")
               ("CANCELLED")))))

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, and org-protocol
(setq org-capture-templates
    (quote (("t" "todo" entry (file "~/org/refile.org")
             "* TODO %?\n%U\n%a\n  %i" :clock-in t :clock-resume t)
            ("n" "note" entry (file "~/org/refile.org")
             "* %? :NOTE:\n%U\n%a\n  %i" :clock-in t :clock-resume t)
            ("j" "Journal" entry (file+datetree "~/org/diary.org")
             "* %?\n%U\n  %i" :clock-in t :clock-resume t)
            ("w" "org-protocol" entry (file "~/org/refile.org")
             "* TODO Review %c\n%U\n  %i" :immediate-finish t)
            ("p" "Phone call" entry (file "~/org/refile.org")
             "* PHONE %? :PHONE:\n%U\n  %i\n" :clock-in t :clock-resume t)
            ("h" "Habit" entry (file "~/org/refile.org")
             "* TODO %?\n%U\n%a\nSCHEDULED: %t\n:PROPERTIES:\n:STYLE: habit\n:END:\n  %i"))))

; Targets include this file and any file contributing to the agenda - up to 2 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 2))))

; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))

;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Clocking setup

;; Resume clocking tasks when emacs is restarted
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Small windows on my Eee PC displays only the end of long lists which isn't very useful
(setq org-clock-history-length 10)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Do not change task states when clocking in
(setq org-clock-in-switch-to-state nil)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist (quote history))
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

;; Agenda log mode items to display (clock time only by default)
(setq org-agenda-log-mode-items (quote (clock)))

;; Agenda clock report parameters
(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 5 :fileskip0 t :compact t)))

; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@office" . ?o)
                            ("@home" . ?h)
                            (:endgroup)
                            ("PHONE" . ?p)
                            ("QUOTE" . ?q)
                            ("WAITING" . ?w)
                            ("PERSONAL" . ?P)
                            ("WORK" . ?W)
                            ("ORG" . ?O)
                            ("SNAMELLIT" . ?S)
                            ("MELEXIS" . ?M)
                            ("crypt" . ?E)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?C)
                            ("FLAGGED" . ??))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;; Org Babel load support for different languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (dot . t)
   (ditaa . t)
   (R . t)
   (python . t)
   (ruby . t)
   (gnuplot . t)
   (clojure . t)
   (sh . t)
   (org . t)
   (plantuml . t)
   (latex . t)
   (sql . t)
   (sqlite . t)
   (clojure . t)
   (js . t)))

;; Org Babel setup for fancy graphics etc
(setq org-ditaa-jar-path "~/Dropbox/tools/ditaa0_9.jar")
(setq org-plantuml-jar-path "~/Dropbox/tools/plantuml.jar")

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)


; set language support using customize. Does not get picked up here.

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

;; checklists
(require 'org-checklist)


(defun pti-catlines (lines)
  (mapconcat 'identity lines "\n"))

;; Latex export options
(setq org-export-latex-classes
      (quote (("article" "\\documentclass[a4paper,11pt]{article}
[PACKAGES]
[EXTRA]
\\CenterWallPaper{1.0}{/home/pti/org/portrait.pdf} " ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}") ("\\paragraph{%s}" . "\\paragraph*{%s}") ("\\subparagraph{%s}" . "\\subparagraph*{%s}")) ("report" "\\documentclass[11pt]{report}
[PACKAGES]
[EXTRA]
\\CenterWallPaper{1.0}{/home/pti/org/portrait.pdf} " ("\\part{%s}" . "\\part*{%s}") ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}")) ("book" "\\documentclass[11pt]{book}
[PACKAGES]
[EXTRA]
\\CenterWallPaper{1.0}{/home/pti/org/portrait.pdf} " ("\\part{%s}" . "\\part*{%s}") ("\\chapter{%s}" . "\\chapter*{%s}") ("\\section{%s}" . "\\section*{%s}") ("\\subsection{%s}" . "\\subsection*{%s}") ("\\subsubsection{%s}" . "\\subsubsection*{%s}")) ("beamer" "\\documentclass{beamer}
[PACKAGES]
[EXTRA]
\\usetheme{Boadilla}
\\usecolortheme{seagull}
\\usefonttheme{structurebold}
\\setbeamersize{sidebar width left=0.5in, sidebar width right=0.5in, text margin left=0.5in, text margin right=0.5in}
\\usebackgroundtemplate{\\includegraphics[width=\\paperwidth]{/home/pti/org/presentation_bg.pdf}} " org-beamer-sectioning))))

(setq org-export-latex-default-packages-alist
      (quote (
              ("AUTO" "inputenc" t)
              ("T1" "fontenc" t)
              ("" "fixltx2e" nil)
              ("" "graphicx" t)
              ("" "longtable" nil)
              ("" "float" nil)
              ("" "wrapfig" nil)
              ("" "soul" t)
              ("" "textcomp" t)
              ("" "marvosym" t)
              ("" "wasysym" t)
              ("" "latexsym" t)
              ("" "amssymb" t)
              ("colorlinks=true, linkcolor=blue, citecolor=blue, filecolor=blue, urlcolor=blue" "hyperref" nil) "\\tolerance=1000")))

(setq org-export-latex-packages-alist
      (quote (
              ("" "wallpaper" nil)
              ("" "bookman" nil))))

;; Support pomodoro workflow

(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)
(add-hook 'org-clock-in-hook
          '(lambda ()
             (if (not org-timer-current-timer)
                 (org-timer-set-timer))))
