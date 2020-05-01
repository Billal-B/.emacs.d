(use-package ivy)
(use-package ivy-hydra)
(use-package swiper)
(use-package counsel)
(use-package ivy-rich)
(use-package counsel-projectile)

(ivy-mode 1)
(ivy-rich-mode 1)
(counsel-projectile-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(setq projectile-completion-system 'ivy)
(setq ivy-initial-inputs-alist nil)

(use-package all-the-icons-ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup)
  :config
  (setq all-the-icons-ivy-file-commands
        '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir))
  (setq all-the-icons-spacer " ")
  :ensure t)

(use-package ivy-posframe
  :ensure
  :after ivy
  :config
  (setq ivy-posframe-parameters
        '((left-fringe . 2)
          (right-fringe . 2)
          (internal-border-width . 2)
          ))
  (setq ivy-posframe-height-alist
        '((swiper . 15)
          (swiper-isearch . 15)
          (t . 10)))
  (setq ivy-posframe-display-functions-alist
        '((complete-symbol . ivy-posframe-display-at-point)
          (swiper . nil)
          (swiper-isearch . nil)
          (t . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-mode 1))

(general-define-key
 "M-x" 'counsel-M-x
 "C-x C-f" 'counsel-find-file
 "C-c o" 'swiper
 "C-c r" 'ivy-resume
 "C-c f" 'counsel-recentf
 "C-c a" 'counsel-ag)


(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; ivy/counsel
(general-define-key
 :keymaps 'ivy-minibuffer-map
 "TAB" 'ivy-call
 "C-z" 'ivy-dispatching-done
 "RET" 'ivy-alt-done)
