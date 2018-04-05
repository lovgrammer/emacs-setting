(defun find-package ()
  (let ((pkg (member "src" (split-string default-directory "/" t))))
    (cond ((member "model" (reverse pkg)) (mapconcat 'identity (cdr (reverse (cdr (member "model" (reverse pkg))))) "."))
	  ((member "provider" (reverse pkg)) (mapconcat 'identity (cdr (reverse (cdr (member "provider" (reverse pkg))))) "."))
	  ((member "rest" (reverse pkg)) (mapconcat 'identity (cdr (reverse (cdr (member "rest" (reverse pkg))))) "."))
	  ((member "task" (reverse pkg)) (mapconcat 'identity (cdr (reverse (cdr (member "task" (reverse pkg))))) "."))
	  ((member "ui" (reverse pkg)) (mapconcat 'identity (cdr (reverse (cdr (member "ui" (reverse pkg))))) "."))
	  ((member "util" (reverse pkg)) (mapconcat 'identity (cdr (reverse (cdr (member "util" (reverse pkg))))) "."))
	  ((member "web" (reverse pkg)) (mapconcat 'identity (cdr (reverse (cdr (member "web" (reverse pkg))))) "."))
	  ((member "widget" (reverse pkg)) (mapconcat 'identity (cdr (reverse (cdr (member "widget" (reverse pkg))))) "."))
	  (t (mapconcat 'identity (cdr pkg) "."))
	  )))

(defun find-project-directory ()
  (concat "/" (let ((pkg (split-string default-directory "/" t)))
    (cond ((member "model" (reverse pkg)) (mapconcat 'identity (reverse (cdr (member "model" (reverse pkg)))) "/"))
	  ((member "provider" (reverse pkg)) (mapconcat 'identity (reverse (cdr (member "provider" (reverse pkg)))) "/"))
	  ((member "rest" (reverse pkg)) (mapconcat 'identity (reverse (cdr (member "rest" (reverse pkg)))) "/"))
	  ((member "task" (reverse pkg)) (mapconcat 'identity (reverse (cdr (member "task" (reverse pkg)))) "/"))
	  ((member "ui" (reverse pkg)) (mapconcat 'identity (reverse (cdr (member "ui" (reverse pkg)))) "/"))
	  ((member "util" (reverse pkg)) (mapconcat 'identity (reverse (cdr (member "util" (reverse pkg)))) "/"))
	  ((member "web" (reverse pkg)) (mapconcat 'identity (reverse (cdr (member "web" (reverse pkg)))) "/"))
	  ((member "widget" (reverse pkg)) (mapconcat 'identity (reverse (cdr (member "widget" (reverse pkg)))) "/"))
	  (t (mapconcat 'identity pkg "/"))
	  )) "/"))

(defun test ()
  (with-current-buffer
      (while (re-search-forward "INSTALLED_APPS = (" nil t)
	(insert "\n    \"core\","))))

(defun change-server (str)
  (interactive "sEnter server domain : ")
  (with-temp-buffer
    (insert-file-contents (concat (find-project-directory) "ApiPaths.java"))
    (while (re-search-forward "\"http://\\([^\"]+\\)\"" nil t)
      (replace-match (concat "\"http://" str "\"")))
    (write-file (concat (find-project-directory) "ApiPaths.java"))))

(defun change-debug (str)
  (interactive "sEnter debug (true/false) : ")
  (with-temp-buffer
    (insert-file-contents (concat (find-project-directory) "Config.java"))
    (while (re-search-forward "DEBUG = \\([^;]+\\);" nil t)
      (replace-match (concat "DEBUG = " str ";")))
    (write-file (concat (find-project-directory) "Config.java"))))

(defun append-string-to-class (str path)
  (with-temp-buffer
    (insert-file-contents path)
    (goto-char (point-max))
    (forward-line -1)
    (insert (concat str "\n"))
    (write-file path)))

(defun make-apipath-with-string (str)
  (upcase (replace-regexp-in-string "/" "_" str)))

(defun add-apipath (apipath)
  (interactive "sEnter api path : ")
  (append-string-to-class (concat "    public static final String " (make-apipath-with-string apipath) "_PATH = \"" apipath "\";") (concat (find-project-directory) "ApiPaths.java")))

(defun make-something (name clsname)
  (with-temp-buffer
    (insert name)
    (let ((filename (concat (find-project-directory) name "/" clsname ".java")))
      (write-file filename))
    )
  (progn
    (find-file (concat (find-project-directory) name "/" clsname ".java"))
    (goto-char (- (point-max) 1))
    (yas-expand))
  )

(defun make-something-network (name clsname apipath)
  (with-temp-buffer
    (insert name)
    (let ((filename (concat (find-project-directory) name "/" clsname ".java")))
      (write-file filename))
    )
  (progn
    (add-apipath apipath)
    (find-file (concat (find-project-directory) name "/" clsname ".java"))
    (goto-char (- (point-max) 1))
    (yas-expand))
  )

(defun make-task (clsname apipath objname)
  (interactive "sEnter the class name : \nsEnter the api path : \nsEnter the object name : ")
  (make-something-network "task" clsname apipath))

(defun make-provider (clsname apipath)
  (interactive "sEnter the class name : \nsEnter the api path : ")
  (make-something-network "provider" clsname apipath))

(defun make-model (clsname)
  (interactive "sEnter the class name : ")
  (make-something "model" clsname))

(defun get-layout-directory ()
  (concat "/" (mapconcat 'identity (append (reverse (cdr (member "src" (reverse (split-string default-directory "/" t))))) '("res" "layout")) "/") "/"))

(defun hello (arg)
  (interactive "s")
  (print (test)))

(defun open-layout (p1 p2)
  (interactive "r")
  (find-file (concat (get-layout-directory) (buffer-substring-no-properties p1 p2) ".xml")))

(provide 'android-template)
