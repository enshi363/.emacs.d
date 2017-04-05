(require-package 'powerline)
;(require-package 'color-theme)
;(require-package 'color-theme-solarized)
(require-package 'material-theme)


(load-theme 'material t)
;(powerline-default-theme)
(powerline-center-theme)
;(setq powerline-default-separator 'contour)
(setq powerline-default-separator 'slant)
(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)
;(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
;(load-theme 'solarized t)



(provide 'init-theme)
