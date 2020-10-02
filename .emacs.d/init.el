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
   '(uniquify which-key use-package spell-fu rainbow-delimiters projectile moody modus-vivendi-theme exec-path-from-shell evil-magit evil-escape doom-modeline dashboard counsel company all-the-icons-ivy-rich)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
