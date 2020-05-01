(use-package projectile)
(use-package treemacs)

(projectile-mode +1)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
