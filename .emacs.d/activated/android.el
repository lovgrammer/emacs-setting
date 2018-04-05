;;================= javadoc-lookup ================
(add-to-list 'load-path "~/.emacs.d/vendor/javadoc-lookup")
(require 'javadoc-import)
(require 'javadoc-lookup)
(global-set-key (kbd "C-h j") 'javadoc-lookup)
(global-set-key (kbd "C-h i") 'add-java-import)
(javadoc-add-roots "c:/Users/jylee/AppData/Local/Android/Sdk/docs/reference/")

;;=================== android mode ===============
(require 'android-mode)
(setq android-mode-sdk-dir "c:/Users/jylee/AppData/Local/Android/Sdk")

;; gradle mode
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-gradle-mode")
(require 'gradle-mode)
(gradle-mode 1)

;; ================= custom ================
(add-to-list 'load-path "~/.emacs.d/vendor/android-template-mode")
(require 'android-template)
