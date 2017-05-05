(require-package 'nlinum)
(require-package 'autopair)
(require-package 'ace-jump-mode)
(require-package 'multiple-cursors)
(require-package 'switch-window)
(require-package 'ido-vertical-mode)
(require-package 'flx)
(require-package 'flx-ido)

;;setting transparent
;(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

(global-auto-revert-mode t)
(menu-bar-mode -1)
(if (functionp 'tool-bar-mode) (tool-bar-mode -1))
(if (functionp 'scroll-bar-mode) (scroll-bar-mode -1))
(set-default 'cursor-type 'hbar)
(ido-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
;;(setq ido-enable-flex-matching t)

(column-number-mode)
(show-paren-mode)
(global-hl-line-mode)
(winner-mode t)
(windmove-default-keybindings)

(global-nlinum-mode 1)

;(defun nolinum ()
;    (global-nlinum-mode 0)
;    )
;(add-hook 'org-mode-hook 'nolinum)
;;(require-package 'undo-tree)
;;(global-undo-tree-mode t)
;(global-set-key (kbd "C-x C-z") 'undo)
;(defalias 'redo 'undo-tree-redo)
;(global-set-key (kbd "C-x C-S-z") 'redo)
;(global-set-key (kbd "M-/") 'undo-tree-visualize)

(global-set-key (kbd "C->") 'ace-jump-mode)

(global-set-key (kbd "C-}") 'mc/mark-next-like-this)
(global-set-key (kbd "C-{") 'mc/mark-previous-like-this)



(autopair-global-mode)

;; Save all tempfiles in $TMPDIR/emacs$UID/                                                        
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)


(global-set-key (kbd "C-x o") 'switch-window)


(defun doc-block()
  "Insert doc block"
  (interactive)
  (let 
    (
         (beg (point))
         (is-function (looking-at-p " *\\(\\(protected\\)\\|\\(public\\)\\|\\(protected\\)\\)? *function +\\([0-Z_-]+\\)(\\([^,)]+,?\\)*)" ))
         (is-class (looking-at-p "\s*class" ))
         )
        ( insert-string " /**
        * ")
        (if is-function (insert-string 
                          " new function
                          *
                          * @param string $param
                          * @retrun null"))
                          (if is-class (insert-string " new class
                                                      * "))

    (insert-string "
                   * @author ")
    (insert-string (user-real-login-name))
    (insert-string "
                   */
                   ")
                   ;; re intent everything
                   (forward-line 1)
                   (indent-region beg (point))

                   ;; select the description for easy edit
                   (search-backward "/**")
                   (forward-line 1)
                   (search-forward "* ")
                   (set-mark-command nil)
                   (move-end-of-line nil)
                   (setq deactivate-mark nil)
                   )
    )
(global-set-key "\C-cId" 'doc-block)

(add-to-list 'auto-mode-alist '("\\.todo\\'" . org-mode))

(provide 'init-common) 
