;;; init.el --- Drew's emacs config
;;; Commentary:
;;; Code:

;; optimizations to speed up start-up time (per John Wiegley)
(defvar file-name-handler-alist-old file-name-handler-alist)
(setq package-enable-at-startup nil
      file-name-handler-alist nil
      message-log-max 16384
      gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      auto-window-vscroll nil)

;; pulled from better-defaults.el
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; end of better-defaults.el

;; Setup use-package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
;(setq use-package-always-defer t)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-copy-env "WORKON_HOME")
  (exec-path-from-shell-initialize))

;; Add some window niceties
(global-display-line-numbers-mode)

(setq initial-scratch-message ";;C-j evaluate\n;;C-x C-f to save buffer\n\n")

;; defaults:
;; turn off bell
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)
;; https://www.emacswiki.org/emacs/SavePlace
(save-place-mode 1)
(show-paren-mode 1)
;(setq-default indicate-empty-lines t)
;(setq cursor-in-non-selected-windows 'hollow)
;(setq highlight-nonselected-windows t)
;(setq select-enable-clipboard t)

;; -----------
;; Indentation
;; ===========

;; yes, both are needed!
(setq default-tab-width 4)
(setq tab-width 4)
(setq default-fill-column 80)
(setq fill-column 80)
(setq-default evil-indent-convert-tabs nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default evil-shift-round nil)

;; allows turning off of minor modes in modeline
(use-package diminish)

; spelling

(use-package spell-fu
  :diminish
  :init
  (setq spell-fu-faces-exclude '(org-meta-line org-link org-code))
  :config
  (global-spell-fu-mode))


;; add better welcome screen
;; dashboard prereqs
(use-package page-break-lines)
(use-package all-the-icons)
(use-package dashboard
  :requires (page-break-lines all-the-icons)
  :init
  (setq dashboard-startup-banner 'logo)
  :config
  ;; force dashboard to add hooks when command line args are present (making compatible with chemacs)
  (add-hook 'after-init-hook (lambda () (dashboard-insert-startupify-lists)))
  (add-hook 'emacs-startup-hook '(lambda ()
                                   (switch-to-buffer "*dashboard*")
                                   (goto-char (point-min))
                                   (redisplay))))

;; better no splash if dashboard it doesn't work
(setq inhibit-startup-screen t)
(setq initial-buffer-choice "~/.custom-emacs.d/init.el")

;; this doesn't work right with magit :((
;(use-package golden-ratio
;  :diminish
;  :init
;  (setq golden-ratio-exclude-modes 'magit-mode)
;  :config
;  (golden-ratio-mode 1))

;(use-package doom-modeline
;  :hook (after-init . doom-modeline-mode)
;  :init
;  (setq doom-modeline-project-detection 'project)
;  (setq doom-modeline-vcs-max-length 40)
;  (setq doom-modeline-indent-info t))

(use-package modus-vivendi-theme
  :init
  (set-face-attribute 'default nil :family "JetBrains Mono" :height 140)
  (setq modus-vivendi-theme-bold-constructs t)
  (setq modus-vivendi-theme-slanted-constructs t)
  (setq modus-vivendi-theme-mode-line 'moody)
  (setq modus-vivendi-theme-completions 'opinionated)
  (setq modus-vivendi-theme-fringes 'intense)
  (setq modus-vivendi-theme-intense-hl-line t)
  (setq modus-vivendi-theme-intense-paren-match t)
  (setq modus-vivendi-theme-org-blocks 'rainbow)
  (setq modus-vivendi-theme-scale-headings t)
  (setq modus-vivendi-theme-variable-pitch-headings t)
  (setq modus-vivendi-theme-scale-1 1.2
        modus-vivendi-theme-scale-2 1.4
        modus-vivendi-theme-scale-3 1.6
        modus-vivendi-theme-scale-4 1.8
        modus-vivendi-theme-scale-5 2.0)
  :config
  (load-theme 'modus-vivendi t))

; likely want doom-modeline but moody is a minimalistic skin for modeline
(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

;; Completion
;; Would be interesting to try the minimalist approach of using icomplete
;; https://protesilaos.com/dotemacs/#h:b6b13f4f-91f5-416d-9934-b51b4d87770c
(use-package swiper
  :init
  (setq swiper-goto-start-of-match t))

(use-package ivy
  :diminish
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format " (%d/%d) ")
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :requires ivy
  :init
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  :config
  (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :requires (ivy-rich all-the-icons)
  :config
  (all-the-icons-ivy-rich-mode 1))

(use-package which-key
  :diminish
  :init
  (setq which-key-frame-max-height 20
        which-key-sort-order 'which-key-description-order)
  :config
  (which-key-mode))

(use-package company
  :diminish
  :config
  (global-company-mode))

;; SECTION -- DEV

(use-package magit)

(use-package projectile
  :diminish
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode +1))

;; SECTION -- ORG


;; SECTION -- EVIL

(defun my/save-and-kill-buffer ()
  "Helper function to map to :wq."
  (interactive)
  (save-buffer)
  (kill-current-buffer)
)
 
(use-package evil
  :config
  (require 'global-keybinds)
  (evil-ex-define-cmd "q" 'kill-current-buffer)
  (evil-ex-define-cmd "wq" 'my/save-and-kill-buffer)
  (evil-ex-define-cmd "quit" 'evil-save-and-quit)
  (evil-mode 1))

(use-package evil-escape
  :requires evil
  :init
  (setq evil-escape-excluded-states '(normal multiedit emacs motion))
  (setq evil-escape-key-sequence "jk"))

(use-package evil-magit
  :requires (magit evil))


(provide 'init.el)
;;; init.el ends here
