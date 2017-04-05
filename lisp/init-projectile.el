(require-package 'projectile)

(setq projectile-keymap-prefix (kbd "C-c C-p"))
(projectile-mode)

(setq projectile-file-exists-remote-cache-expire nil)

(provide 'init-projectile)
