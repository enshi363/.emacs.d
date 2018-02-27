(require-package 'web-mode)
(require-package 'emmet-mode)

(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)


(provide 'init-web)
