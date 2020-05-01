(use-package doom-themes)

(setq recentf-exclude (org-agenda-files))
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-center-content t)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
(setq show-week-agenda-p t)
(setq dashboard-items '((recents  . 10)
                        (projects . 10)
                        (agenda . 5)))
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-set-footer nil)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-icons t)
  (centaur-tabs-group-by-projectile-project))

(use-package all-the-icons)
(use-package all-the-icons-dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package rainbow-delimiters
  :config
  (require 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  :ensure t)

(load-theme 'doom-dracula t)

;; required for doom-modeline
(use-package ghub)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 20)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon nil)
  (setq doom-modeline-buffer-modification-icon nil)
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-indent-info nil)
  (setq doom-modeline-checker-simple-format t)
  (setq doom-modeline-github t)
  (setq doom-modeline-github-interval (* 30 60))
  (setq doom-modeline-persp-name nil)
  (setq doom-modeline-modal-icon t)
  (setq doom-modeline-gnus nil))

;; (use-package    feebleline
;;   :ensure       t
;;   :config       (setq feebleline-msg-functions
;;                       '((feebleline-line-number         :post "" :fmt "%5s")
;;                         (feebleline-column-number       :pre ":" :fmt "%-2s")
;;                         (feebleline-file-directory      :face feebleline-dir-face :post "")
;;                         (feebleline-file-or-buffer-name :face font-lock-keyword-face :post "")
;;                         (feebleline-file-modified-star  :face font-lock-warning-face :post "")
;;                         (feebleline-git-branch          :face feebleline-git-face :pre " : ")
;;                         (feebleline-project-name        :align right)))
;;                 (feebleline-mode 1))

(set-face-attribute 'default nil
		    :family "IBM Plex Mono"
		    :foundry "IBM"
		    :slant 'normal
		    :weight 'normal :height 98
		    :width 'normal)
