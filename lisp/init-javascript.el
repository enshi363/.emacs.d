(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)


(provide 'init-javascript)
