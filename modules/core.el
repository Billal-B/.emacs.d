(use-package general)
(use-package hydra)
(use-package hercules)

(require 'general)

(global-hl-line-mode t)
(electric-pair-mode t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq mouse-yank-at-point t)
(global-visual-line-mode t) ; enable visual line mode (soft wrap) globally
(show-paren-mode t)
(winner-mode 1)

(setq recentf-max-saved-items 300)

(setq savefiles-dir (expand-file-name "savefiles" user-emacs-directory))
(setq backup-directory-alist `(("." . ,savefiles-dir)))
(setq make-backup-files t
      delete-old-versions t
      delete-by-moving-to-trash t
      backup-by-copying t
      kept-new-versions 9
      kept-old-versions 6
      version-control t
      auto-save-default t
      auto-save-timeout 20
      auto-save-interval 100)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-margin 3)

(general-create-definer mode-leader
  :states '(normal insert emacs)
  :prefix "ù"
  :non-normal-prefix "M-ù")
