;;(require 'helm-treemacs-icons)
;;(helm-treemacs-icons-enable)

(use-package helm)
(require 'helm-config)
(use-package helm-projectile)
(require 'helm-projectile)

(helm-mode 1)

(customize-set-variable 'helm-ff-lynx-style-map t) ; allow going up/down dir with helm using arrow keys
(setq helm-display-header-line t
      helm-autoresize-mode t
      helm-autoresize-min-height 20
      helm-autoresize-max-height 40
      helm-move-to-line-cycle-in-source nil
      helm-allow-mouse t
      helm-prevent-escaping-from-minibuffer nil)

(add-hook 'eshell-mode-hook
	  (lambda ()
	    (eshell-cmpl-initialize)
	    (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
	    (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(general-define-key
 "C-x C-f" 'helm-find-files
 "M-x" 'helm-M-x
 "M-y" 'helm-show-kill-ring
 "C-x b" 'helm-buffers-list
 "C-x C-b" 'helm-buffers-list
 "C-c f" 'helm-recentf)

(general-define-key
 :keymaps 'helm-map
 "<tab>" 'helm-execute-persistent-action
 "C-i" 'helm-execute-persistent-action
 "C-z"  'helm-select-action)
