(require 'org)         
(require 'ob)          
(require 'ob-tangle)   

;; Define paths for configuration files.
(defconst cg/emacs-directory (concat (getenv "HOME") "/.emacs.d/"))
(defconst cg/dot-files-src (file-name-directory load-file-name))

(defun cg/tangle-files (orgfiles)
  (while orgfiles
    (org-babel-tangle-file (car orgfiles))
    (setq orgfiles (cdr orgfiles))))

(defun cg/build-dot-files ()
  (message "Tangling the source from orgfiles")
  (make-directory (concat cg/emacs-directory "elisp") t)
  (cg/tangle-files (directory-files cg/dot-files-src t "\\.org$")))

(cg/build-dot-files)
