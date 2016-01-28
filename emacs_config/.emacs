(setenv "HOME" "C:/softwares/emacs-24.4-bin-i686-pc-mingw32/emacs_directory")
(setenv "PATH" "C:/softwares/emacs-24.4-bin-i686-pc-mingw32/emacs_directory")

;;打开Steve Purcell emacs 配置
(add-to-list 'load-path "C:/softwares/emacs-24.4-bin-i686-pc-mingw32/emacs_directory/emacs.d")
;;(require 'init)
;;(load-file "~/.emacs.d/init.el")


;;每次退出emacs自动保存状态，下次打开自动恢复
(desktop-save-mode 1)

;;使用F5重新刷新当前buffer（在被别的程序更改之后）
(defun refresh-file ()  
  (interactive)  
  (revert-buffer t (not (buffer-modified-p)) t))      
(global-set-key [(control f5)] 'refresh-file)


;;set the default file path
(setq default-directory "C:/softwares/emacs-24.4-bin-i686-pc-mingw32/emacs_directory")

(message "11111 load config successfully")
(load-file "~/../emacs_config/face-setting.el")

(message "load config successfully")

;;highlight-parentheses
(load-file "~/../emacs_config/highlight-parentheses.el")
(highlight-parentheses-mode t)


;;w3m配置项（用于上网）
(add-to-list 'load-path "C:/softwares/emacs-24.4-bin-i686-pc-mingw32/thirdparty/windows_emacs_w3m/w3m-lisp") ;;w3m所需要的lisp文件，所在路径
(add-to-list 'exec-path "C:/softwares/emacs-24.4-bin-i686-pc-mingw32/thirdparty/windows_emacs_w3m/w3m") ;;指定w3m可执行程序，所在的执行路径
(require 'w3m-load)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.baidu.com")

(autoload 'w3m "w3m" "interface for w3m on emacs" t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)

;settings
(setq w3m-default-display-inline-image t) 
(setq w3m-default-toggle-inline-images t)

(setenv "LANG" "zh_CN.UTF-8")

;;tabbar工具,在最上面以页卡方式显示当前打开的所有文件
(add-to-list 'load-path "C:/softwares/emacs-24.4-bin-i686-pc-mingw32/emacs_config/")
(require 'tabbar)
(tabbar-mode 1)
(global-set-key [(meta k)] 'tabbar-forward)
(global-set-key [(meta j)] 'tabbar-backward)
; close default tabs，and move all files into one group
(setq tabbar-buffer-list-function
    (lambda ()
        (remove-if
          (lambda(buffer)
             (find (aref (buffer-name buffer) 0) " *"))
          (buffer-list))))
(setq tabbar-buffer-groups-function
      (lambda()(list "All")))
(set-face-attribute 'tabbar-button nil)

;;set tabbar's backgroud color
(set-face-attribute 'tabbar-default nil
                    :background "gray"
                    :foreground "gray30")
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :background "green"
                    :box '(:line-width 3 :color "DarkGoldenrod") )
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 3 :color "gray"))

;; USEFUL: set tabbar's separator gap
(custom-set-variables '(tabbar-separator (quote (1.5))))


;;helm-swoop 多文件查找
;; Example config
;; ----------------------------------------------------------------
;; ;; helm from https://github.com/emacs-helm/helm
(add-to-list 'load-path "C:/softwares/emacs-24.4-bin-i686-pc-mingw32/emacs_config/helm")
(require 'helm)

;; ;; Locate the helm-swoop folder to your path
;; ;; This line is unnecessary if you get this program from MELPA
;; (add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")

 (require 'helm-swoop)

;; ;; Change keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; ;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; ;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; ;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; ;; Split direction. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; ;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;; ;; Go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t)

;; ;; Optional face for line numbers
;; ;; Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)
;;--------------------------------------------------------------------------

;;;一些通用配置
(setq inhibit-startup-message t) ;关闭启动画面
(setq column-number-mode t) ;显示列号
(global-linum-mode t)
;;; 括号匹配时显示另一个括号而不是跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq frame-title-format "%b %I") ;显示文件名和大小

(auto-image-file-mode t) ;让Emacs可以直接打开、显示图片
(fset 'yes-or-no-p 'y-or-n-p) ;以Y/N代表yes/no
(setq auto-save-default nil) ;不生成名为#filename#的临时文件
(setq x-select-enable-clipboard t) ;支持和外部程序的拷贝
(global-font-lock-mode t) ;打开语法高亮




