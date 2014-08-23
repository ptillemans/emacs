
;; on the mac we need to tell the apps launched to use utf8
;; as the character encoding
(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

;; Note:
;; on the Mac, it is possible that the eterm-color terminfo is
;; missing.
;; This causes the lines in zsh to start with '4m' and generally
;; the terminal behaves weird when wrapping.
;;
;;In this case create a folder ~/.terminfo and run
;;
;; $ cd
;; $ mkdir .terminfo
;; $ tic -o .terminfo ...
;; ...  /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti
;;
;; on the command line.
;;
;; after restarting the ansi-shell the terminal will behave a lot
;; better

(global-set-key "\C-x\C-z" 'shell)      ; shortcut for shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(eval-after-load 'shell
  '(progn
     (define-key shell-mode-map [up] 'comint-previous-input)
     (define-key shell-mode-map [down] 'comint-next-input)
     (define-key shell-mode-map "\C-p" 'comint-previous-input)
     (define-key shell-mode-map "\C-n" 'comint-next-input)))
