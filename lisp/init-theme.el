(require-package 'powerline)
;;(require-package 'color-theme)
;(require-package 'color-theme-solarized)
;(require-package 'material-theme)
(require-package 'zenburn-theme)

;;(load-theme 'zenburn t)
 ;(add-to-list 'default-frame-alist
              ;'(font . "DejaVu Sans Mono for Powerline-16"))
;(set-face-attribute 'default t :font "DejaVu Sans Mono for Powerline-16")

;(setq solarized-broken-srgb t)
;(setq solarized-degrade t)

(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(powerline-default-theme)
;(load-theme 'solarized-dark t)
;(powerline-center-theme)
;(setq powerline-default-separator 'contour)
;(setq powerline-default-separator 'wave)
;(setq powerline-default-separator 'slant)
(set-face-attribute 'mode-line nil
                    ;:foreground "White"
                    ;:background "DarkOrange"
                    :box nil)
;(set-face-foreground 'modeline-inactive "gray")
;(set-face-background 'modeline-inactive "DarkOrange")


(load-theme 'zenburn t)

;(load-theme 'material t)
(setq display-time-format "%Y-%m-%d %H:%M")
(display-time-mode)
(set-face-background 'hl-line "gray 20")

(provide 'init-theme)
