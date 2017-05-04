(require-package 'powerline)
;;(require-package 'color-theme)
;(require-package 'color-theme-solarized)
(require-package 'material-theme)
;(require-package 'solarized-theme)
;(require-package 'zenburn-theme)

;(load-theme 'zenburn t)
 ;(add-to-list 'default-frame-alist
              ;'(font . "DejaVu Sans Mono for Powerline-16"))
;(set-face-attribute 'default t :font "DejaVu Sans Mono for Powerline-16")

;(setq solarized-broken-srgb t)
;(setq solarized-degrade t)

(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'material t)
;(powerline-default-theme)
(powerline-center-theme)
;(setq powerline-default-separator 'contour)
;(setq powerline-default-separator 'wave)
(setq powerline-default-separator 'slant)
(set-face-attribute 'mode-line nil
                    :foreground "White"
                    :background "DarkOrange"
                    :box nil)
(set-face-foreground 'modeline-inactive "gray")
(set-face-background 'modeline-inactive "DarkOrange")



(setq display-time-format "%Y-%m-%d %H:%M")
(display-time-mode)


(provide 'init-theme)
