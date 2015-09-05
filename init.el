(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(load-theme 'deeper-blue)
(setq ring-bell-function 'ignore)

;(global-prettify-symbols-mode t)
(global-linum-mode)
(column-number-mode t)
(delete-selection-mode 1)
(package-refresh-contents)

(server-start)

;; UNCOMMENT ON FIRST RUN
;; (setq package-archives
;;    '(("gnu" . "http://elpa.gnu.org/packages/")
;; 	("marmalade" . "https://marmalade-repo.org/packages/")
;; 	("melpa" . "http://melpa.org/packages/")))

(require 'package)
(package-initialize)
(package-refresh-contents)

(defvar my-packages '(paredit
		      clojure-mode
    		      clojure-mode-extra-font-locking
		      lua-mode
		      cider
		      ido-ubiquitous
		      smart-mode-line
		      smart-mode-line-powerline-theme))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(require 'clojure-mode)
(require 'clojure-mode-extra-font-locking)
(require 'lua-mode)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;---sml MODE LINE-----
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" default)))
 '(org-agenda-files (quote ("~/emacscommands.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq sml/theme 'powerline)
(sml/setup)
;-----------------

(ido-mode 1)
(ido-everywhere 1)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'subword-mode)

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)
(add-hook 'nrepl-mode-hook 'turn-on-paredit)
(add-hook 'lisp-mode-hook 'turn-on-paredit)
(add-hook 'cider-repl-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'clojurescript-mode-hook 'turn-on-paredit)

(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)

(defun select-next-window ()
  "Switch to the next window"
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window"
  (interactive)
  (select-window (previous-window)))

(global-set-key (kbd "M-`") 'select-next-window)
(global-set-key (kbd "M-~")  'select-previous-window)

(global-set-key (kbd "C-/") 'undo)
(global-set-key (kbd "C-?") 'redo)

(add-hook 'clojure-mode-hook
          (lambda ()
            (push '("fn" . ?λ) prettify-symbols-alist)
            (push '(">=" . ?≥) prettify-symbols-alist)
            (push '("<=" . ?≤) prettify-symbols-alist)
            ;(push '("->" . ?→) prettify-symbols-alist)
            ;(push '("->>" . ?↠) prettify-symbols-alist)
            ))

(setq initial-frame-alist '((top . 0)
                            (left . 0)
                            (width . 160)
                            (height . 40)))
