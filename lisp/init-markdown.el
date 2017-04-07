(require-package 'markdown-mode)
(require-package 'markdown-toc)

(autoload 'markdown-mode "markdown-mode"
             "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
             "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


(custom-set-variables
  '(markdown-command "/opt/local/bin/multimarkdown")
  '(markdown-toc-header-toc-start "<!-- customized start-->")
  '(markdown-toc-header-toc-title "**customized title**")
  '(markdown-toc-header-toc-end "<!-- customized end -->"))

(provide 'init-markdown)
