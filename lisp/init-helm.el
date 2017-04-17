(require-package 'helm)
(require-package 'helm-ag)
(require-package 'helm-css-scss)


(helm-mode 1)
(helm-popup-tip-mode 1)
(helm-adaptive-mode 1)
(helm-push-mark-mode 1)
(helm-top-poll-mode 1)


(defun helm/version (arg)
    (interactive "P")
      (let ((version-str (format "Helm version: %s" (helm/version-1))))
            (if arg (insert version-str) (message version-str))))

(defun helm/git-version ()
    (shell-command-to-string
         "git log --pretty='format:%H' -1"))

(defun helm/turn-on-header-line ()
    (interactive)
      (setq helm-echo-input-in-header-line t)
        (setq helm-split-window-in-side-p t)
          (helm-autoresize-mode -1)
            (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)
              )

(defun helm/turn-off-header-line ()
    (interactive)
      (setq helm-echo-input-in-header-line nil)
        ;;(helm-autoresize-mode 1)
          (setq helm-split-window-in-side-p nil)
            (remove-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)
              )

(defun helm/occur-which-func ()
    (interactive)
      (with-current-buffer
              (or (helm-aif (with-helm-buffer
                                                    (window-buffer helm-persistent-action-display-window))
                                          (and (null (minibufferp it)) it))
                            helm-current-buffer)
                  (when (eq major-mode 'emacs-lisp-mode)
                          (message "[%s]" (which-function)))))

(define-key helm-moccur-map (kbd "C-M-a") 'helm/occur-which-func)
(define-key helm-grep-map   (kbd "C-M-a") 'helm/occur-which-func)

(defun helm/modify-ido-temp-list ()
    (let ((bl (mapcar #'buffer-name (buffer-list (selected-frame)))))
          (setq ido-temp-list (nconc (cdr bl) (list (car bl))))))
;;(add-hook 'ido-make-buffer-list-hook 'helm/modify-ido-temp-list)

(defun helm-ag-find-file-init (directory)
    (start-process "ag-find-file" nil "ag" "--hidden" "-g" helm-pattern directory))

(defclass helm-ag-find-file-class (helm-source-async)
    ((filtered-candidate-transformer
           :initform
               (lambda (candidates _source)
                       (cl-loop for c in candidates
                                               collect (helm--ansi-color-apply c))))
        (requires-pattern :initform 2)
           (candidate-number-limit :initform 99999)))

(defun helm-ag-find-file-1 (directory)
    (helm :sources (helm-make-source "AG find files" 'helm-ag-find-file-class
                                                        :candidates-process (lambda ()
                                                                                                                       (helm-ag-find-file-init directory))
                                                                           :action (helm-actions-from-type-file))
                  :buffer "*helm ag find file*"))

(defun helm-ag-find-file ()
    (interactive)
      (helm-ag-find-file-1 (expand-file-name default-directory)))

(defun helm-ff-ag-find-files (_candidate)
    (helm-ag-find-file-1 helm-ff-default-directory))

(defun helm-ff-run-ag-find-files ()
    (interactive)
      (with-helm-alive-p
            (helm-exit-and-execute-action 'helm-ff-ag-find-files)))

(define-key helm-find-files-map (kbd "C-c f") 'helm-ff-run-ag-find-files)


;;(global-set-key (kbd "M-x")                          'undefined)
;;(global-set-key (kbd "M-x")                          'helm-M-x)
;;(global-set-key (kbd "M-y")                          'helm-show-kill-ring)
;;(global-set-key (kbd "C-x C-f")                      'helm-find-files)


;;; helm find files
;;
;;(define-key helm-find-files-map (kbd "C-d") 'helm-ff-persistent-delete)
;;(define-key helm-buffer-map (kbd "C-d")     'helm-buffer-run-kill-persistent)
;;(define-key helm-find-files-map (kbd "C-/") 'helm-ff-run-find-sh-command)


(provide 'init-helm)
