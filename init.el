;;; marmalade + packages
;;; ------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless package-archive-contents
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
                      nrepl
                      scala-mode2)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (unless (package-installed-p p)
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

;;; whitespace cleanup on save
;;; ------------------------------------------------------------------
(add-hook 'before-save-hook 'whitespace-cleanup)

;; load the ensime lisp code...
(add-to-list 'load-path "~/.emacs.d/ensime/elisp/")
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
