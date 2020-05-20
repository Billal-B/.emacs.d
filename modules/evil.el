(use-package evil)
(use-package evil-visualstar)
(use-package evil-mc)

(require 'evil)
(require 'general)
(require 'evil-mc)
(evil-mode 1)

(setq evil-want-fine-undo nil)

(setq evil-insert-state-map (make-sparse-keymap))

(setq evil-default-state 'insert)

(evil-set-initial-state 'dashboard-mode 'insert)
(evil-set-initial-state 'edebug-mode 'insert)
(evil-set-initial-state 'term-mode 'insert)
(evil-set-initial-state 'magit-mode 'insert)
(evil-set-initial-state 'dired-mode 'insert)
(evil-set-initial-state 'docker-image-mode 'insert)
(evil-set-initial-state 'docker-container-mode 'insert)
(evil-set-initial-state 'docker-volume-mode 'insert)
(evil-set-initial-state 'docker-network-mode 'insert)
(evil-set-initial-state 'help-mode 'insert)
(evil-set-initial-state 'help-mode 'insert)
(evil-set-initial-state 'xref--xref-buffer-mode 'insert)
(evil-set-initial-state 'kubernetes-mode 'insert)
(evil-set-initial-state 'flycheck-error-list-mode 'insert)
(evil-set-initial-state 'text-mode 'insert)
(evil-set-initial-state 'cider-repl-mode 'insert)
(evil-set-initial-state 'cider-inspector-mode 'insert)
(evil-set-initial-state 'edebug-mode 'insert)
(evil-set-initial-state 'treinsert-mode 'insert)
(evil-set-initial-state 'org-mode 'insert)

(define-key evil-normal-state-map (kbd "M-.")
  `(menu-item "" evil-repeat-pop :filter
              ,(lambda (cmd) (if (eq last-command 'evil-repeat-pop) cmd))))

(setq evil-insert-state-cursor 'bar)
(setq evil-emacs-state-cursor 'hbar)

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

(define-key evil-insert-state-map (kbd "C-o") 'evil-jump-backward)
(define-key evil-insert-state-map (kbd "C-i") 'evil-jump-forward)
