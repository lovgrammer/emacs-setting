(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-splash-screen t)
(global-linum-mode t)
(scroll-bar-mode -1)


;; theme
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-robin-hood)

;parantheses
(show-paren-mode 1)

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
;; jinja2 mode
;; (add-to-list 'load-path "~/.emacs.d/vendor/jinja2-mode")
;; (require 'jinja2-mode)
;; (add-to-list 'auto-mode-alist
;;              '("\\.html\\'" . (lambda ()
;; 				(html-mode)
;; 				(rainbow-mode)
;; 				(jinja2-mode))))

;; scrolling mode
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; full screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(provide 'jong-gui)
