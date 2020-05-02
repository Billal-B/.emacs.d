(use-package evil)
(use-package evil-visualstar)
(use-package evil-mc)

(require 'evil)
(require 'general)
(require 'evil-mc)
(evil-mode 1)

(setq evil-want-fine-undo t)

(evil-set-initial-state 'dashboard-mode 'emacs)
(evil-set-initial-state 'edebug-mode 'emacs)
(evil-set-initial-state 'term-mode 'emacs)
(evil-set-initial-state 'magit-mode 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'docker-image-mode 'emacs)
(evil-set-initial-state 'docker-container-mode 'emacs)
(evil-set-initial-state 'docker-volume-mode 'emacs)
(evil-set-initial-state 'docker-network-mode 'emacs)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'xref--xref-buffer-mode 'emacs)
(evil-set-initial-state 'kubernetes-mode 'emacs)
(evil-set-initial-state 'flycheck-error-list-mode 'emacs)
(evil-set-initial-state 'text-mode 'insert)
(evil-set-initial-state 'cider-repl-mode 'emacs)
(evil-set-initial-state 'cider-inspector-mode 'emacs)
(evil-set-initial-state 'edebug-mode 'emacs)
(evil-set-initial-state 'treemacs-mode 'emacs)

(define-key evil-normal-state-map (kbd "M-.")
  `(menu-item "" evil-repeat-pop :filter
              ,(lambda (cmd) (if (eq last-command 'evil-repeat-pop) cmd))))

(setq evil-insert-state-cursor 'hbar)
(setq evil-emacs-state-cursor 'bar)

(global-evil-mc-mode 1)

(general-define-key
 :states 'normal
 "gz" 'bb/evil-mc)

(hercules-def
 :toggle-funs #'bb/evil-mc
 :keymap 'evil-mc-cursors-map
 :transient t
 :flatten t)

(global-set-key (kbd "M-h") 'evil-window-move-far-left)
(global-set-key (kbd "M-j") 'evil-window-move-very-bottom)
(global-set-key (kbd "M-k") 'evil-window-move-very-top)
(global-set-key (kbd "M-l") 'evil-window-move-far-right)

(global-set-key (kbd "C-z") 'evil-force-normal-state)
(global-set-key (kbd "<escape>") 'evil-force-normal-state)

(define-key evil-normal-state-map (kbd "q") 'nil)
(define-key evil-normal-state-map (kbd "Q") 'evil-record-macro)
(define-key evil-insert-state-map (kbd "C-k") 'windmove-up)
