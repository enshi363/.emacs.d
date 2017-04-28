(require-package 'projectile)

;;(require-package 'helm-projectile)
;;(helm-projectile-on)

(projectile-mode)
(setq projectile-keymap-prefix (kbd "C-c p"))

(setq projectile-enable-caching t)
(setq projectile-file-exists-remote-cache-expire nil)

(setq projectile-indexing-method 'find)

(setq projectile-globally-ignored-directories
      (append '(
                ".git"
                ".svn"
                "vendor"
                "node_modules"
                "dist"
                )
              projectile-globally-ignored-directories))

(setq projectile-globally-ignored-files
      (append '(
                ".DS_Store"
                "*.gz"
                "*.pyc"
                "*.jar"
                "*.tar.gz"
                "*.tgz"
                "*.zip"
                )
              projectile-globally-ignored-files))
(projectile-global-mode)


(provide 'init-projectile)
