;;================= javadoc-lookup ================
(add-to-list 'load-path "~/.emacs.d/vendor/javadoc-lookup")
(require 'java-import)
(require 'javadoc-lookup)
(require 'java-complete)
(add-hook 'java-mode-hook (lambda () (local-set-key (kbd "C-<return>") 'java-complete)))
(global-set-key (kbd "C-h j") 'javadoc-lookup)
(global-set-key (kbd "C-h i") 'add-java-import)

(javadoc-add-roots "~/Developer/android-sdk/docs/reference/")

;;=================== android mode ===============
(add-to-list 'load-path "~/.emacs.d/vendor/android-mode")
(require 'android-mode)
(require 'android)
(setq android-mode-sdk-dir "~/Developer/android-sdk")


;; ================= gradle mode ================
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-gradle-mode")
(require 'gradle-mode)
(gradle-mode 1)
(add-to-list 'load-path "~/.emacs.d/vendor")

;; ================= custom ================
(require 'android-template)
(require 'android-template-django)
(defun open-android-project (arg)
  (interactive "sEnter project name : ")
  (find-file (concat "~/work/android/projects/" arg)))
(provide 'jong-android)
