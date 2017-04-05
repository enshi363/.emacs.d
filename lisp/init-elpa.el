(require 'package) ;; You might already have this line
(add-to-list 'package-archives
                       '("popkit" . "http://elpa.popkit.org/packages/"))
;
;(add-to-list 'package-archives
;             '("melpa" . "https://melpa.org/packages/"))

;(add-to-list 'package-archives
;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;(add-to-list 'package-archives
;             '("marmalade" . "https://marmalade-repo.org/packages/") t)
;(add-to-list 'package-archives
;             '("gnu" . "https://elpa.gnu.org/packages/") t)
;(package-initialize) ;; You might already have this line

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(require-package 'cl-lib)

(provide 'init-elpa)
