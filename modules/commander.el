(use-package general)
(use-package which-key)
(use-package ranger)
(use-package magit)
(use-package deft)
(use-package helm-swoop)
(use-package docker)
(use-package kubernetes)
(use-package helm-org-rifle)

(require 'bb-func)
(require 'general)
(require 'helm-org-rifle)

(require 'which-key)
(which-key-mode +1)
(setq which-key-sort-order #'which-key-prefix-then-key-order
  which-key-sort-uppercase-first nil
  which-key-add-column-padding 1
  which-key-max-display-columns nil
  which-key-min-display-lines 6
  which-key-side-window-slot -10)

(set-face-attribute 'which-key-local-map-description-face nil :weight 'bold)

(global-set-key [mouse-3] 'mouse-popup-menubar-stuff)
(global-set-key (kbd "C-<mouse-5>") 'text-scale-decrease)
(global-set-key (kbd "C-<mouse-4>") 'text-scale-increase)
(global-set-key [C-down-mouse-3] 'yank)
(global-set-key (kbd "C-²") 'other-frame)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "M-,") 'kill-buffer-and-window)
(global-set-key (kbd "C-!") 'bb-eshell-projectile-here)
(global-set-key (kbd "C-M-:") 'helm-company)
(global-set-key (kbd "C-:") 'company-complete)
(global-set-key (kbd "C-<tab>") 'bb-ivy-switch-buffer)
(global-set-key (kbd "C-M-<left>") 'winner-undo)
(global-set-key (kbd "C-M-<right>") 'winner-redo)
(global-set-key (kbd "C-S-f") 'helm-projectile-ag)

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

(define-key evil-normal-state-map (kbd "SPC") nil)

(general-define-key
  ;; :prefix my-leader
  :states '(normal insert emacs)
  :prefix "SPC"
  :non-normal-prefix "<f12>"
 "e" '(:ignore t :which-key "Edits")
 "ee" 'helm-show-kill-ring
 "eu" 'undo-tree-visualize
 "f" '(:ignore t :which-key "Files")
 "fd" 'dired-jump
 "fD" 'ranger
 "ff" 'helm-find-files
 "fg" 'thunar
 "fl" 'helm-locate
 "fn" 'deft
 "fN" 'deft-new-file
 "fo" 'bb-org-rifle
 "fr" 'helm-recentf
 "ft" 'treemacs
 "o" '(:ignore t :which-key "Search (occur/ag)")
 "oa" 'helm-do-grep-ag
 "oA" 'helm-do-ag
 "om" 'helm-multi-swoop-all
 "oM" 'helm-multi-swoop
 "oo" 'helm-occur
 "oO" 'helm-swoop
 "t" '(:ignore t :which-key "Tools")
 "td" 'docker
 "tk" 'kubernetes-overview
 "tm" 'magit-status
 "tt" 'terminal-here
 "t+" 'calc
 "w" '(:ignore t :which-key "Window")
 "wm" 'menu-bar-mode
 "wc" 'bb/tear-off-window
 "ww" 'toggle-truncate-lines
 ;; others
 "a" 'org-capture
 "A" 'org-agenda
 "b" 'helm-mini
 "p" 'projectile-command-map
 "RET" 'helm-resume
 "!" 'helm-company
 "M-x" 'helm-M-x ; useful in cases of bugs
 "<right>" 'evil-window-move-far-right
 "<left>" 'evil-window-move-far-left
 "<up>" 'evil-window-move-very-top
 "<down>" 'evil-window-move-very-bottom
 )
