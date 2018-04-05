(defun trim-string (string)
  "Remove white spaces in beginning and ending of STRING.
White space here is any of: space, tab, emacs newline (line feed, ASCII 10)."
  (replace-regexp-in-string "\n" "" string)
)
(defun get-server-directory ()
  (replace-regexp-in-string "~" "Users/jongyunlee" (concat "/" (mapconcat 'identity (append (reverse (cdr (cdr (member "src" (reverse (split-string default-directory "/" t)))))) '("server")) "/") "/testsite")))

(defun copy-dir (fromDir toDir)
  (shell-command (concat "cp -R " fromDir " " toDir)))

(defun init-server-database (str)
  (interactive "s(enter)")
  (copy-dir "~/Developer/custom/core" (get-server-directory))
  (add-django-app "core" (concat (get-server-directory) "/testsite/settings.py"))
  (add-django-app "testapp" (concat (get-server-directory) "/testsite/settings.py"))
  (add-url-include "testapp" (concat (get-server-directory) "/testsite/urls.py"))
  (copy-dir "~/Developer/custom/core" (get-server-directory))
  (copy-dir "~/Developer/custom/testapp" (get-server-directory)))

(defun add-django-app (str path)
  (with-temp-buffer
    (insert-file-contents path)
    (while (re-search-forward "INSTALLED_APPS = (" nil t)
      (insert (concat "\n    \"" str "\",")))
    (write-file path)))

(defun add-url-include (str path)
  (with-temp-buffer
    (insert-file-contents path)
    (while (re-search-forward "urlpatterns = patterns(''," nil t)
      (insert (concat "\n    url(r'^" str "/', include('" str ".urls')), ")))
    (write-file path)))

(defun add-test-url (str path)
  (with-temp-buffer
    (insert-file-contents path)
    (while (re-search-forward "import patterns, url" nil t)
      (insert (concat "\nfrom testapp.views import " (upcase-initials str) "View")))
    (while (re-search-forward "urlpatterns = patterns (''," nil t)
      (insert (concat "\n    url(r'^" str "/', " (upcase-initials str) "View.as_view(), name='" str "'),")))
    (write-file path)))

(defun add-test-view (str jpath)
  (interactive (list (read-string "Enter view name : ") (read-file-name "Open directory:")))
  (add-test-url str (concat (get-server-directory) "/testapp/urls.py"))
  (add-django-view str (concat (get-server-directory) "/testapp/views.py")
		   (with-temp-buffer
		     (insert-file-contents jpath)
		     (replace-regexp-in-string "\n" "" (buffer-string)))))

(defun add-django-view (str path content)
  (with-temp-buffer
    (insert-file-contents path)
    (goto-char (point-max))
    (insert "\n")
    (insert-file-contents "~/Developer/custom/android-django-templates/view.py")
    (while (re-search-forward "\{name\}" nil t)
      (replace-match (upcase-initials str)))
    (while (re-search-forward "\{content\}" nil t)
      (replace-match (concat "\'" content "\'")))
    (write-file path)))

(provide 'android-template-django)
