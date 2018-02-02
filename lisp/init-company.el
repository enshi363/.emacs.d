(require-package 'company)
(require-package 'company-flx)
(require-package 'company-php)
(require-package 'company-go)
(require-package 'php-eldoc)
(require-package 'ac-php)
(company-mode 1)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing


;(add-hook 'php-mode-hook
         ;'(lambda ()
            ;(require 'company-php)
            ;(company-mode t)
            ;(add-to-list 'company-backends 'company-ac-php-backend )))

(add-hook 'php-mode-hook
          '(lambda ()
             (require 'ac-php)
             (require 'company-php)
             (company-mode t)
             (ac-php-core-eldoc-setup) ;; enable eldoc
             (make-local-variable 'company-backends)
             (add-to-list 'company-backends 'company-ac-php-backend)))


(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
(add-hook 'after-init-hook 'global-company-mode)

(setq company-flx-limit 2000)
(with-eval-after-load 'company
                        (company-flx-mode +1))
;;(company-flx-mode +1)

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
    (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
      (if (check-expansion)
        (company-complete-common)
        (indent-for-tab-command)))))

(global-set-key [tab] 'tab-indent-or-complete)

(provide 'init-company)
