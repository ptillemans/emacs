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
     (output-pdf "xdg-open")
     (output-html "xdg-open"))))
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "ff02e8e37c9cfd192d6a0cb29054777f5254c17b1bf42023ba52b65e4307b76a" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default)))
 '(global-eldoc-mode nil)
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
 '(multi-term-scroll-show-maximum-output t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
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
     ("\\.pdf\\'" . "setsid xdg-open %s"))))
 '(org-jira-serv-alist
   (quote
    ((melexis password wqsXSbjSthVqr78Y username pti url\  https://jira\.melexis\.com/jira))))
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
    (auctex-lua auctex htmlize elpy js-doc command-log-mode aggressive-indent aggressive-indent-mode which-key lacarte solarized-theme zenburn-theme slime editorconfig company-racer racer flycheck-rust flycheck magit tidy groovy-mode js2-mode go-eldoc go-mode clojure-mode company multiple-cursors yasnippet edit-server skewer-mode helm-projectile web-mode virtualenvwrapper smart-mode-line scss-mode scala-mode rvm ruby-test-mode ruby-refactor ruby-electric ruby-compilation ruby-additional rspec-mode rainbow-delimiters python-django paredit org-jira nose markdown-mode js2-refactor jedi helm go-snippets go-projectile ggtags fill-column-indicator elixir-yasnippets ein color-theme-solarized color-theme-sanityinc-solarized cider alchemist ace-jump-mode)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(rcirc-server-alist
   (quote
    (("irc.freenode.net" :channels
      ("#emacs" "#rcirc" "#clojure" "#cucumber" "#leiningen" "#ubuntu-bugs"))
     ("irc.geekshed.net" \#jupiterbroadcasting nil))) t)
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
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tidy-shell-command "/usr/local/bin/tidy")
 '(tidy-temp-directory "~/tmp")
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(which-key-mode t)
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-todo ((((background dark) (type graphic)) (:weight bold :foreground "#002b36" :background "#dc322f")) (((background dark) (type tty) (min-colors 256)) (:weight bold :foreground "brightblack" :background "red")) (((background dark) (type tty) (min-colors 16)) (:weight bold :foreground "brightblack" :background "red")) (((background dark) (type tty) (min-colors 8)) (:weight bold :foreground "black" :background "red")) (((background light) (type graphic)) (:weight bold :foreground "#fdf6e3" :background "#dc322f")) (((background light) (type tty) (min-colors 256)) (:weight bold :foreground "brightwhite" :background "red")) (((background light) (type tty) (min-colors 16)) (:weight bold :foreground "brightwhite" :background "red")) (((background light) (type tty) (min-colors 8)) (:weight bold :foreground "white" :background "red")))))
