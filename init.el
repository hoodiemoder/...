(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(defun anita/compile-all
    (interactive)
  (mapc (lambda (directory)
	  (byte-recompile-directory directory 0 nil))
	load-path))

(require 'use-package)

(use-package use-package
  :config
  (setq use-package-always-ensure nil
	use-package-always-defer nil
	use-package-always-denand nil
	use-package-expand-minimally nil))

;; (use-package evil
;;   :ensure t
;;   :config (evil-mode)
;;   (setq evil-want-keybinding nil))

;; (use-package evil-collection
;;   :ensure t
;;   :after evil
;;   :config
;;   (evil-collection-init))

(setq auto-save-default nil
      create-lockfiles nil
      delete-old-versions -1
      vc-make-backup-files t)


(tool-bar-mode -1)
(toggle-scroll-bar -1)
(column-number-mode 1)

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1))

(use-package inf-lisp
  :init
  (setq inferior-lisp-program "ecl"))

(use-package sly :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(manoj-dark))
 '(package-selected-packages
   '(magit composer web-mode eglot php-mode rainbow-delimiters sly smooth-scrolling use-package evil-collection))
 '(warning-suppress-types '((comp) (comp) (comp) (comp) (comp) (comp) (comp) (comp))))

;; PHP configuration

(use-package php-mode
  :ensure t)

(use-package eglot
  :ensure t)

(use-package composer
  :ensure t
  :after php-mode)

(use-package magit
  :ensure t)

(use-package web-mode
  :ensure t
  :config   
  (setq web-mode-imenu-regexp-list
	'(("<\\(h[1-9]\\)\\([^>]*\\)>\\([^<]*\\)" 1 3 ">" nil)
	  ("^[ \t]*<\\([@a-z]+\\)[^>]*>? *$" 1 " id=\"\\([a-zA-Z0-9_]+\\)\"" "#" ">")
	  ("^[ \t]*<\\(@[a-z.]+\\)[^>]*>? *$" 1 " contentId=\"\\([a-zA-Z0-9_]+\\)\"" "=" ">")
	  ;; angular imenu
	  (" \\(ng-[a-z]*\\)=\"\\([^\"]+\\)" 1 2 "="))))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(use-package rainbow-delimiters
	     :ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "green"))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "dark green"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "blue"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "purple"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "cyan"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "pink"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "white")))))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
