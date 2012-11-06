;;; marmalade + packages
;;; ------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      clojure-mode
                      clojure-test-mode
                      fill-column-indicator
                      auto-complete
                      smooth-scrolling
                      nrepl)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;; fill-column-indicator
;;; ------------------------------------------------------------------
(add-hook 'after-change-major-mode-hook 'fci-mode)

;;; save session
;;; ------------------------------------------------------------------
(desktop-save-mode 1)

;;; prevent backups (git is my VCS)
;;; ------------------------------------------------------------------
(setq make-backup-files nil)
