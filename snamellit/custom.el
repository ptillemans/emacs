(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "open")
     (output-html "open"))))
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(mocha-options "--recursive -r babel-register")
 '(multi-term-scroll-show-maximum-output t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(ns-alternate-modifier (quote meta))
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODO's"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("b" "All tasks in current buffer" todo-tree "" nil))))
 '(org-agenda-files
   (quote
    ("~/org/snamellit/snm_general.org" "~/org/melexis/ea/setup-ea.org" "~/org/melexis/projects/pos/point-of-sales.org" "/Users/pti/org/flagged.org" "~/org/melexis/edi-program.org" "~/org/notes.org" "~/org/melexis/management/brecht.org" "~/org/melexis/melexis.org" "/Users/pti/org/google_calendar.org" "/Users/pti/org/diary.org" "/Users/pti/org/index.org" "/Users/pti/org/refile.org" "/Users/pti/org/todo.org")))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "open %s"))))
 '(org-jira-default-assignee (quote pti))
 '(org-jira-serv-alist
   (quote
    ((melexis password wqsXSbjSthVqr78Y username pti url\  https://jira\.melexis\.com/jira))))
 '(org-latex-classes
   (quote
    (("mlx-beamer" "\\documentclass{mlx-beamer}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("mlx-book" "\\documentclass{mlx-book}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("mlx-report" "\\documentclass{mlx-report}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("mlx-article" "\\documentclass{mlx-article}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("snm-beamer" "\\documentclass{snm-beamer}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("snm-book" "\\documentclass{snm-book}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("snm-report" "\\documentclass{snm-report}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("snm-article" "\\documentclass{snm-article}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("beamer" "\\documentclass[presentation]{beamer}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))
 '(org-latex-default-packages-alist
(quote
 (("AUTO" "inputenc" t)
  ("T1" "fontenc" t)
  ("" "fixltx2e" nil)
  ("" "graphicx" t)
  ("" "longtable" nil)
  ("" "float" nil)
  ("" "wrapfig" nil)
  ("" "rotating" nil)
  ("normalem" "ulem" t)
  ("" "amsmath" t)
  ("" "textcomp" t)
  ("" "marvosym" t)
  ("" "wasysym" t)
  ("" "amssymb" t)
  ("" "hyperref" nil)
  "\\tolerance=1000"
  ("" "minted" nil))))
 '(org-latex-listings (quote minted))
 '(org-return-follows-link t)
'(org-structure-template-alist
(quote
 (("S" "#+BEGIN_SRC emacs-lisp
?
#+END_SRC" "<src lang=\"?\">

</src>")
  ("s" "#+BEGIN_SRC ?

#+END_SRC" "<src lang=\"?\">

</src>")
  ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE" "<example>
?
</example>")
  ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE" "<quote>
?
</quote>")
  ("v" "#+BEGIN_VERSE
?
#+END_VERSE" "<verse>
?
</verse>")
  ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM" "<verbatim>
?
</verbatim>")
  ("c" "#+BEGIN_CENTER
?
#+END_CENTER" "<center>
?
</center>")
  ("l" "#+BEGIN_LaTeX
?
#+END_LaTeX" "<literal style=\"latex\">
?
</literal>")
  ("L" "#+LaTeX: " "<literal style=\"latex\">?</literal>")
  ("h" "#+BEGIN_HTML
?
#+END_HTML" "<literal style=\"html\">
?
</literal>")
  ("H" "#+HTML: " "<literal style=\"html\">?</literal>")
  ("a" "#+BEGIN_ASCII
?
#+END_ASCII" "")
  ("A" "#+ASCII: " "")
  ("i" "#+INDEX: ?" "#+INDEX: ?")
  ("I" "#+INCLUDE: %file ?" "<include file=%file markup=\"?\">"))))
'(package-selected-packages
(quote
 (gist google-contacts googleaccount oauth2 es-mode realgud genrnc ghc haskell-cabal toml-mode yaml-mode cargo cargo-mode rust-snippets indent-tools jedi coffee-mode haskell-mode tide solarized-theme rinari org-pomodoro feature-mode ecukes auto-compile use-package helm-projectile magit markdown-mode web-mode company-racer racer flycheck-rust scala-mode rspec-mode ruby-test-mode ruby-additional ein elpy js2-refactor slime go-projectile groovy-mode cider clojure-mode paredit ggtags rainbow-delimiters flycheck multiple-cursors editorconfig command-log-mode which-key helm smart-mode-line mocha expand-region company-tern tern auctex-lua auctex htmlize aggressive-indent aggressive-indent-mode lacarte tidy go-eldoc edit-server skewer-mode virtualenvwrapper scss-mode rvm ruby-refactor ruby-electric ruby-compilation python-django nose go-snippets fill-column-indicator elixir-yasnippets alchemist ace-jump-mode)))
'(pos-tip-background-color "#073642")
'(pos-tip-foreground-color "#93a1a1")
'(rcirc-bright-nicks
(quote
 ("jwiegley" "bbatsov" "hiredman" "technomancy" "kodein" "wasamasa" "wgreenhouse")))
 '(rcirc-log-flag t)
 '(rcirc-log-process-buffers t)
'(rcirc-server-alist
(quote
 (("irc.freenode.net" :channels
   ("#emacs" "#rcirc" "#clojure" "#cucumber" "#leiningen" "#ubuntu-bugs"))
  ("irc.geekshed.net" \#jupiterbroadcasting nil))) t)
'(rng-schema-locating-files
(quote
 ("schemas.xml" "/usr/local/Cellar/emacs/25.1/share/emacs/25.1/etc/schema/schemas.xml" "~/.emacs.d/schema/schema.xml")))
'(safe-local-variable-values
(quote
 ((python-shell-virtualenv-path . "/Users/pti/playpen/python/gmailpurge")
  (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
")
  (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
")
  (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
  (python-shell-prompt-output-regexp . "Out[[0-9]+]: ")
  (python-shell-prompt-regexp . "In [[0-9]+]: ")
  (python-shell-interpreter-args . "/Users/pti/playpen/python/gmailpurge/manage.py")
  (python-shell-interpreter . "python")
  (buffer-read-only . 1)
  (ruby-compilation-executable . "ruby")
  (ruby-compilation-executable . "ruby1.8")
  (ruby-compilation-executable . "ruby1.9")
  (ruby-compilation-executable . "rbx")
  (ruby-compilation-executable . "jruby"))))
'(tidy-shell-command "/usr/local/bin/tidy")
'(tidy-temp-directory "~/tmp")
'(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-todo ((((background dark) (type graphic)) (:weight bold :foreground "#002b36" :background "#dc322f")) (((background dark) (type tty) (min-colors 256)) (:weight bold :foreground "brightblack" :background "red")) (((background dark) (type tty) (min-colors 16)) (:weight bold :foreground "brightblack" :background "red")) (((background dark) (type tty) (min-colors 8)) (:weight bold :foreground "black" :background "red")) (((background light) (type graphic)) (:weight bold :foreground "#fdf6e3" :background "#dc322f")) (((background light) (type tty) (min-colors 256)) (:weight bold :foreground "brightwhite" :background "red")) (((background light) (type tty) (min-colors 16)) (:weight bold :foreground "brightwhite" :background "red")) (((background light) (type tty) (min-colors 8)) (:weight bold :foreground "white" :background "red")))))
