(setq gnus-select-method '(nntp "news.aioe.org"))


;; set email reader 
 (setq gnus-secondary-select-methods '((nnml ""))) 

 ;; set pop server 
 (setq mail-sources 
      '((pop :server "POP.MAIL.YAHOO.COM"   ;; 在这里设置 pop3 服务器
             :user "waterlin@ymail.com"     ;; 用户名
             :port "pop3"
             :password "password")))        ;; 密码

 ;; set smtp 
 (setq smtpmail-auth-credentials 
    '(("SMTP.MAIL.YAHOO.COM"                ;; SMTP 服务器
       25                                   ;; 端口号
       "waterlin@ymail.com"                 ;; 用户名
       "yourpassword")))                    ;; 密码

 (setq smtpmail-default-smtp-server "SMTP.MAIL.YAHOO.COM") 
 (setq smtpmail-smtp-server "SMTP.MAIL.YAHOO.COM") 
 (setq message-send-mail-function 'smtpmail-send-it)
