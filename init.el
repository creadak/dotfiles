(when (window-system)
  (toggle-frame-fullscreen)
  (tool-bar-mode 0)
  (scroll-bar-mode -1)
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1)))

(menu-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(load-theme 'tango-dark)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(setq-default tab-always-indent 'complete)

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq custom-file (concat (getenv "HOME") "/.emacs.d/custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package apache-mode
  :ensure t)

(use-package coffee-mode
  :ensure t)

(use-package demo-it
  :ensure t)

(use-package helm
  :ensure t
  :bind
  (("M-x" . helm-M-x)
   ("C-c f" . helm-find)))

(use-package js2-mode
  :ensure t
  :mode
  ("\\.js$" . js2-mode)
  :init
  (setq js-basic-indent 2)
  :config
  (setq-default js2-basic-indent 2)
  (setq-default js2-basic-offset 2))

(use-package json-mode
  :ensure t)

(use-package latex-preview-pane
  :if window-system
  :ensure t
  :config
  (latex-preview-pane-enable))

(use-package linum
  :ensure t
  :bind
  ("C-c l" . linum-mode)
  :init
  (setq linum-format "%d ")
  (global-linum-mode 1))

(use-package linum-off
  :ensure t
  :init (setq linum-disabled-modes-list '(compilation-mode
                                          dired-mode
                                          doc-view-mode
                                          eshell-mode
                                          image-mode
                                          wl-summary-mode)))

(use-package nodejs-repl
  :ensure t)

(use-package magit
  :ensure t
  :bind
  ("C-c g" . magit-status))

(use-package markdown-mode
  :ensure t)

(use-package nginx-mode
  :ensure t)

(use-package python-mode
  :ensure t
  :config (setq-default python-indent 2))

(use-package org
  :ensure t
  :config
  (setq org-agenda-files '("~/Nextcloud/Org")
        org-directory "~/Nextcloud/Org"
        org-mobile-inbox-for-pull "~/Nextcloud/Org/flagged.org"
        org-mobile-directory "~/Nextcloud/Org/MobileOrg"
        org-mobile-files '("~/Nextcloud/Org")
        org-archive-location (format-time-string
                              "~/Nextcloud/Org/Archive/%Y-%m/archive-%d.org::"
                              (current-time))
        org-refile-targets '((nil :maxlevel . 5)
                             (org-agenda-files :maxlevel . 5))
        org-return-follow-links t
        org-src-fontify-natively t
        org-hide-leading-stars t
        org-log-done t
        org-capture-templates `(
                                ("j" "Journal Entry"
                                 entry (file+olp "~/Nextcloud/Org/Notebook.org"
                                                 "Journal"
                                                 ,(format-time-string "%Y")
                                                 ,(format-time-string "%B"))
                                 "* %<%A %d>%?"
                                 :empty-lines 1)
                                ("m" "Meeting Notes"
                                 entry (file+olp "~/Nextcloud/Org/Notebook.org"
                                                 "Meetings"
                                                 ,(format-time-string "%Y")
                                                 ,(format-time-string "%B"))
                                 "* %?"
                                 :empty-lines 1)
                                ("n" "General Note"
                                 entry (file "~/Nextcloud/Org/Notebook.org")
                                 "* %?"
                                 :empty-lines 1)
                                ("p" "Presentation"
                                 entry (file+headline "~/Nextcloud/Org/Notebook.org" "Presentations")
                                 "* %^{prompt}\n** Outline\n%?\n** Abstract\n** Slide Text"
                                 :empty-lines 1)
                                ("r" "Recipe"
                                 entry (file "~/Nextcloud/Org/Notebook.org")
                                 "* %^{prompt}\n** Ingredients\n %? \n** Method"
                                 :empty-lines 1)))
        :bind
        (("C-c a" . org-agenda)
         ("C-c c" . org-capture)))

(use-package org-mobile-sync
  :ensure t
  :config
  (org-mobile-sync-mode 1))

(use-package tramp
  :ensure t
  :config
  (setq tramp-password-prompt-regexp
        (concat "^.*"
                (regexp-opt
                 '("passphrase" "Passphrase"
                   "password" "Password"
                   "SecurID Username [cgavagan]") t)
                ".*:\0? *")))

(use-package sass-mode
  :ensure t)

(use-package scss-mode
  :ensure t)

(use-package smartparens
  :ensure t)

(use-package sr-speedbar
  :ensure t
  :config
  (setq speedbar-show-unknown-files t))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :bind
  ("C-c y n" . yas-new-snippet))

(use-package zygospore
  :ensure t
  :bind
  ("C-x 1" . zygospore-toggle-delete-other-windows))

(sr-speedbar-open)
            
