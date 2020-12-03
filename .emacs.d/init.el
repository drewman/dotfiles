;;; package --- Summary
;;; Commentary:
;;
;;; Code:

;(org-tangle-file (expand-file-name "Drew.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "Drew.org" user-emacs-directory))
;(provide 'init.el)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-sidebar org restart-emacs emacs-restart general uniquify which-key use-package spell-fu rainbow-delimiters projectile moody modus-vivendi-theme exec-path-from-shell evil-magit evil-escape doom-modeline dashboard counsel company all-the-icons-ivy-rich))
 '(safe-local-variable-values
   '((eval progn
           (org-babel-goto-named-src-block "startblock")
           (org-babel-execute-src-block)
           (outline-hide-sublevels 1))
     (org-confirm-babel-evaluate))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
