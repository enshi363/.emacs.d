(require-package 'goto-chg)
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-matchit)
(require-package 'undo-tree)


(global-evil-leader-mode)
(evil-mode 1)
(evil-leader/set-leader ",")

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "d"  'helm-show-kill-ring
  "x" 'helm-M-x
  "k" 'kill-buffer)


(require-package 'evil-nerd-commenter)
;; Emacs key bindings
;;(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
;;(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
;;(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
;;(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)
(evil-leader/set-key
    "ci" 'evilnc-comment-or-uncomment-lines
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cc" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line
    "."  'evilnc-copy-and-comment-operator
    "pf"  'projectile-find-file
    "pp"  'projectile-switch-project
    )

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)


(cl-loop for (mode . state) in '((inferior-emacs-lisp-mode . emacs)
                              (shell-mode . insert)
                              (git-commit-mode . insert)
                              (git-rebase-mode . emacs)
                              (magit-branch-manager-mode . emacs))
      do (evil-set-initial-state mode state))

(global-evil-matchit-mode 1)

(provide 'init-evil)
