;;; init.el --- Load the full configuration -*- lexical-binding: t -*-

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;----------------------------------------------------------------------------
;; Setup packages
;;----------------------------------------------------------------------------
;; src:https://github.com/WolfeCub/dotfiles/blob/master/emacs/.emacs.d/init.el
(require 'package)
;; Setup package sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(setq package-enable-at-startup nil)
(setq package-pinned-packages '((use-package . "melpa")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;;----------------------------------------------------------------------------
;; Add to load path
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;----------------------------------------------------------------------------
;; Enable literate 
;;----------------------------------------------------------------------------
;; Use latest org before calling babel
(use-package-pin-package 'org "org")
(use-package org
  :ensure org-plus-contrib)
(require 'org)
;; src:https://emacs.stackexchange.com/questions/3143/can-i-use-org-mode-to-st
;; ructure-my-emacs-or-other-el-configuration-file
(defun load-org-module (module)
  (org-babel-load-file
   (expand-file-name module
		     modules-dir)
   t))

;;----------------------------------------------------------------------------
;; Load modules
;;----------------------------------------------------------------------------
;; (defvar modules-dir (expand-file-name "modules" user-emacs-directory))

;; enable/disable modules here
(defun featurep! (module)
  (cond
   ((eq module 'ivy) nil)
   ((eq module 'helm) t)
   ((eq module 'tabs) t)
   ))

(org-babel-load-file
   (expand-file-name "config.org"
		     user-emacs-directory)
   t)
;; base
;; (load-org-module "utils.org")
;; (load-org-module "core.org")
;; (load-org-module "exec-path.org")
;; (load-org-module "editor.org")
;;  
;; ;; completion
;; ;;(load-org-module "lsp.org")
;; (load-org-module "company.org")
;; (load-org-module "helm.org")
;; ;;(load-org-module "ivy.org")
;;  
;; ;; tools
;; (load-org-module "evil.org")
;; (load-org-module "org-mode.org")
;; (load-org-module "eshell.org")
;; 
;; ;; lang
;; (load-org-module "clojure.org")
;; (load-org-module "python.org")
;; 
;; ;; editor
;; (load-org-module "projectile.org")
;; (load-org-module "smartparens.org")
;; (load-org-module "appearance.org")
;; (load-org-module "commander.org")

;;----------------------------------------------------------------------------
;; And finally start the server
;;----------------------------------------------------------------------------
(server-start)
