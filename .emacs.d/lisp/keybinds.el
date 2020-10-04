; SECTION -- KEYBINDS
;; (defvar my/leader-map
;;   (make-sparse-keymap)
;;   "Keymap for 'leader' keys.")
(use-package restart-emacs)

(use-package general)

(defun my/open-config
    (interactive)
    (find-file "~/.emacs.d/Drew.org"))

(general-define-key
    :states '(normal visual insert)
    :prefix "SPC"
    :non-normal-prefix "C-SPC"
    "p" '(projectile-command-map :which-key "projectile")
    "x" '(counsel-M-x :which-key "M-x")
    "." '(counsel-find-file :which-key "find file")
    "'" 'ivy-resume

    "f" '(:ignore t :which-key "file")
    "ff" 'counsel-find-file
    "fj" 'counsel-file-jump
    "fp" '(my/open-config :which-key "open personal config")
    "fs" 'save-buffer
    "fM" 'mkdir
    "fN" 'create-empty-file

    "b" '(:ignore t :which-key "buffer")
    "bb" 'counsel-switch-buffer
    "bc" 'kill-current-buffer
    "bd" 'counsel-bookmarked-directory
    "be" 'eval-buffer
    "bk" 'kill-buffer
    "bl" '(evil-switch-to-windows-last-buffer :which-key "last buffer")
    "bm" 'counsel-bookmark
    "bw" 'kill-buffer-and-window

    "d" '(:ignore t :which-key "describe")
    "da" 'counsel-describe-face
    "db" 'describe-bindings
    "dc" 'helpful-command
    "df" 'counsel-describe-function
    "dh" 'info-emacs-manual
    "dk" 'helpful-key
    "dl" 'counsel-find-library
    "dm" 'describe-mode
    "dp" 'helpful-at-point
    "ds" 'counsel-describe-symbol
    "dv" 'counsel-describe-variable
    "dM" 'helpful-macro
    "dV" 'counsel-set-variable

    "g" '(:ignore t :which-key "magit")
    "gb" 'magit-branch-and-checkout
    "gc" 'magit-clone
    "gg" 'magit-status
    "gi" 'magit-init
    "gl" 'magit-log

    "o" '(:ignore t :which-key "org")
    "oa" 'org-agenda
    "oo" 'org-capture

    "w" '(:ignore t :which-key "window")
    "wb" 'balance-windows
    "wd" 'delete-other-windows
    "wn" 'evil-window-new
    "wo" 'other-window
    "wq" 'evil-quit
    "ws" 'evil-window-split
    "wv" 'evil-window-vsplit
    "wh" 'evil-window-left
    "wl" 'evil-window-right
    "wj" 'evil-window-down
    "wk" 'evil-window-up
 )

(general-define-key
    :states '(normal visual insert)
    :prefix "SPC l"
    :non-normal-prefix "C-SPC l"
    "" '(:ignore t :which-key "local")

    :keymap 'org-mode-map
    "c" 'org-confluence-export-as-confluence
    "d" 'org-babel-demarcate-block
    "l" 'org-store-link
    "n" 'org-narrow-to-subtree
    "r" 'org-refile
    "t" 'org-babel-tangle
    "w" 'widen
    "x" 'org-export-dispatch)

;; (which-key-add-key-based-replacements "<SPC> y" "yas")
;; (define-key my/leader-map "yn" 'yas-new-snippet)

;; ;;(evil-global-set-key 'motion "C-," 'er/expand-region)
;; (evil-global-set-key 'normal "/" 'swiper-isearch)
;; (evil-global-set-key 'visual (kbd "C-c c") 'comment-or-uncomment-region)

;; (evil-define-minor-mode-key 'normal 'org-present-mode (kbd "n") 'org-present-next)
;; (evil-define-minor-mode-key 'normal 'org-present-mode (kbd "p") 'org-present-prev)
;; (evil-define-minor-mode-key 'normal 'org-present-mode (kbd "q") 'org-present-quit)

(provide 'keybinds)
