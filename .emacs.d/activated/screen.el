(setq frame-title-format "emacs")

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(set-default 'cursor-type 'box)
 
(ido-mode)

(column-number-mode)

(show-paren-mode)

(global-hl-line-mode -1)

(winner-mode t)

(windmove-default-keybindings)

(require 'package)
(add-to-list 'package-archives
            '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     t)
(package-initialize)

;; packages
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;   (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;;   )



;; (global-set-key (kbd "M-x") 'smex)

;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; full screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; default first page to *scratch*
(setq initial-buffer-choice t)

;; default work directory
(setq default-directory "c:/Users/jylee/work")

;; paste overwrite
(delete-selection-mode 1)

;; move window keybinding changed
(global-set-key (kbd "M-J")  'windmove-left)
(global-set-key (kbd "M-L") 'windmove-right)
(global-set-key (kbd "M-I")    'windmove-up)
(global-set-key (kbd "M-K")  'windmove-down)

;; yes or no to y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; rainbow-mode
(add-to-list 'load-path "~/.emacs.d/vendor/rainbow-mode")
(require 'rainbow-mode)
(add-to-list 'auto-mode-alist
             '("\\.css\\'" . (lambda ()
			       (css-mode)
			       (rainbow-mode))))
(add-to-list 'auto-mode-alist
             '("\\.xml\\'" . (lambda ()
			       (xml-mode)
			       (rainbow-mode))))
(add-to-list 'auto-mode-alist
             '("\\.aidl\\'" . (lambda ()
			       (java-mode))))
(add-to-list 'auto-mode-alist
             '("\\.gradle\\'" . (lambda ()
				  (groovy-mode))))

;; yassnipet
(require 'yasnippet-snippets)
(require 'yasnippet)

(yas-global-mode 1)

;; font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Consolas-14"))
;; Fontify current frame
(fontify-frame nil)
;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)

;; (require 'color-theme)
;; (setq color-theme-is-global t)
;; (color-theme-sanityinc-tomorrow-night)
