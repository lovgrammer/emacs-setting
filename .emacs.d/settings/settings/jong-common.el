(delete-selection-mode t)
;; zshell
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))
(add-to-list 'load-path "~/.emacs.d/vendor/bison-mode")
(require 'bison-mode)
(provide 'jong-common)
