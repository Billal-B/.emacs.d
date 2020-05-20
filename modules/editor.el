(use-package symbol-overlay
  :diminish
  :defines iedit-mode
  :commands (symbol-overlay-get-symbol
             symbol-overlay-assoc
             symbol-overlay-get-list
             symbol-overlay-jump-call)
  :bind (("M-i" . symbol-overlay-put)
         ("M-n" . symbol-overlay-jump-next)
         ("M-p" . symbol-overlay-jump-prev)
         ("M-N" . symbol-overlay-switch-forward)
         ("M-P" . symbol-overlay-switch-backward)
         ("M-C" . symbol-overlay-remove-all)
         ([M-f3] . symbol-overlay-remove-all))
  :hook ((prog-mode . symbol-overlay-mode)
         (iedit-mode . (lambda () (symbol-overlay-mode -1)))
         (iedit-mode-end . symbol-overlay-mode)))

(use-package flycheck
  :init (global-flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  :custom
  (flycheck-display-errors-delay .3))

(use-package pcre2el)
(use-package visual-regexp-steroids
  :bind ("M-%" . vr/query-replace))
(require 'visual-regexp-steroids)

(use-package yaml-mode
  :config
  (require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package dockerfile-mode
  :config
  (require 'dockerfile-mode)
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(global-auto-revert-mode 1)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq dired-listing-switches "-la")

(global-eldoc-mode -1)
(setq eldoc-echo-area-use-multiline-p nil)
