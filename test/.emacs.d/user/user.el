;; appearance
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq use-dialog-box nil)    

;; fonts
(add-to-list 'default-frame-alist '(font . "Hack-13"))
(set-face-attribute 'default nil :font "Hack-13")
(set-face-attribute 'fixed-pitch nil :font "Hack-13")
(set-face-attribute 'variable-pitch nil :font "Noto Sans-13")

;; scrolling
(setq scroll-step               1) 
(setq scroll-margin            5)
(setq scroll-conservatively 10000)

;; line number
(global-hl-line-mode 1)  
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; search
(setq search-highlight        t)
(setq query-replace-highlight t)

;; indents and tabs
(auto-fill-mode -1)          
(setq-default tab-width          4)  
(setq-default standart-indent    4)  
(setq-default c-basic-offset 4 c-indent-level 4 indent-tabs-mode nil)  

;; backups
(setq-default save-place t)  
(setq desktop-path (list "~/.emacs.d/user/saves/"))
(desktop-save-mode 1)  
(setq backup-directory-alist '(("." . "~/.emacs.d/user/saves/")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/user/saves/" t)))

;; ido mode
(ido-mode 1)
(ido-everywhere 1)

;; switching buffers
(global-set-key (kbd "C-c n") 'next-buffer)
(global-set-key (kbd "C-c p") 'previous-buffer)

;; color theme
(use-package distinguished-theme
  :ensure t
  :init
  (load-theme 'distinguished t))

;; move-text
(use-package move-text
  :config
  (global-set-key (kbd "M-p") 'move-text-up)
  (global-set-key (kbd "M-n") 'move-text-down))

;; smex
(use-package smex
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; paredit
(use-package paredit
  :config
  (defun turn-on-paredit ()
    (interactive)
    (paredit-mode 1))
  (add-hook 'emacs-lisp-mode-hook  'turn-on-paredit)
  (add-hook 'lisp-mode-hook        'turn-on-paredit)
  (add-hook 'common-lisp-mode-hook 'turn-on-paredit)
  (add-hook 'scheme-mode-hook      'turn-on-paredit))

;; indent-guide
(use-package indent-guide
  :config
  (setq indent-guide-char "|")
  (indent-guide-global-mode))

