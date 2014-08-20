
(setq gnus-select-method '(nntp "newsgroups.telenet.be"))

(setq gnus-secondary-select-methods '((nnimap "gmail-melexis"
                                               (nnimap-address "imap.gmail.com")
                                               (nnimap-server-port 993)
                                               (nnimap-stream ssl))))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "pti@melexis.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "melexis.com")