;; (defun load-my-library (fname)
;;   "load-library if file(fname) was exists..."
;;   (if (file-exists-p (concat (concat "~/.emacs.d/" fname) ".el")) (progn
;;                                              (load-library fname))))
;; (defun reload-dotemacs ()
;;   "Reload .emacs"
;;   (interactive)
;;   (let (dotemacs-default dotemacs-window)
;;     (setq dotemacs-default "~/.emacs")
;;     (setq dotemacs-window "~/_emacs")
;;     (if (file-exists-p dotemacs-default) (progn
;;                                      (message "Load %s" dotemacs-default)
;;                                      (load-file dotemacs-default)
;;                                      )
;;       (if (file-exists-p dotemacs-window) (progn
;;                                        (message "Load %s" dotemacs-window)
;;                                        (load-file dotemacs-window)
;;                                        )
;;         (message "Could not found dotemacs")
;;         ))))
