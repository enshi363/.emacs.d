(require-package 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))
(yas-global-mode 1)

(require-package 'yasnippet-snippets)

(provide 'init-yasnippet)
