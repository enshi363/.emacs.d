(require-package 'auto-complete)
(require-package 'go-autocomplete)
(ac-config-default)
(global-auto-complete-mode t)

(setq-default ac-expand-on-auto-complete nil)
(add-to-list 'completion-styles 'initials t)

(setq completion-cycle-threshold 5)
(set-default 'ac-sources
             '(ac-source-imenu
                ac-source-dictionary
                ac-source-words-in-buffer
                ac-source-words-in-same-mode-buffers
                ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode
                 log-edit-mode org-mode text-mode haml-mode
                 git-commit-mode
                 sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                 html-mode nxml-mode sh-mode smarty-mode clojure-mode
                 lisp-mode textile-mode markdown-mode tuareg-mode
                 js2-mode css-mode less-css-mode sql-mode
                 sql-interactive-mode
                 inferior-emacs-lisp-mode))
  (add-to-list 'ac-modes mode))


;;complete php
(require-package 'ac-php)
(require-package 'php-eldoc)



(provide 'init-autocomplete)
