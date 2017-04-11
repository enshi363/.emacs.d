(require-package 'projectile)

;;(require-package 'helm-projectile)
;;(helm-projectile-on)

(setq projectile-keymap-prefix (kbd "C-c p"))
(projectile-mode)

(setq projectile-enable-caching t)
(setq projectile-file-exists-remote-cache-expire nil)

(provide 'init-projectile)
