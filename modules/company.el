(use-package company
  :config
  (global-company-mode 1)

  (setq global-company-mode t
	company-auto-complete nil
	company-minimum-prefix-length 2
	company-idle-delay nil
	company-quickhelp-delay 0))

(use-package company-quickhelp
  :config
  (company-quickhelp-mode))

;; (use-package company-box
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   (defun +company-box-icons--elisp-fn (candidate)
;;     (when (derived-mode-p 'emacs-lisp-mode)
;;       (let ((sym (intern candidate)))
;;         (cond ((fboundp sym)  'ElispFunction)
;;               ((boundp sym)   'ElispVariable)
;;               ((featurep sym) 'ElispFeature)
;;               ((facep sym)    'ElispFace)))))

;;   (defadvice! +company-remove-scrollbar-a (orig-fn &rest args)
;;     "This disables the company-box scrollbar, because:
;; https://github.com/sebastiencs/company-box/issues/44"
;;     :around #'company-box--update-scrollbar
;;     (cl-letf (((symbol-function #'display-buffer-in-side-window)
;;                (symbol-function #'ignore)))
;;       (apply orig-fn args)))
;; (setq company-box-show-single-candidate t
;;       company-box-backends-colors nil
;;       company-box-max-candidates 50
;;       company-box-icons-alist 'company-box-icons-all-the-icons
;;       company-box-icons-functions
;;       (cons #'+company-box-icons--elisp-fn
;; 	    (delq 'company-box-icons--elisp
;; 		  company-box-icons-functions))))
