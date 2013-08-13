;; install default packages
(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages '()
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; load customisations
(mapc 'load (directory-files (concat user-emacs-directory user-login-name)
                             t "^[^#].*el$"))

;; prevent backups (git is my VCS)
(setq make-backup-files nil)

;; whitespace cleanup on save
(add-hook 'before-save-hook 'whitespace-cleanup)
