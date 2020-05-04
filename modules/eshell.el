(use-package virtualenvwrapper)

(use-package eshell-toggle)
(use-package hide-mode-line)

(use-package eshell-prompt-extras
  :config
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda))
  (with-eval-after-load "esh-opt"
    (require 'virtualenvwrapper)
    (venv-initialize-eshell)
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda)))

(use-package eshell-z
  :config
  (add-hook 'eshell-mode-hook
            (defun my-eshell-mode-hook ()
              (require 'eshell-z)))
  (unless (file-exists-p eshell-z-freq-dir-hash-table-file-name)
    (setq eshell-z-freq-dir-hash-table-file-name
          (expand-file-name "z" eshell-directory-name))))

(defun doom-call-process (command &rest args)
  "Execute COMMAND with ARGS synchronously.

Returns (STATUS . OUTPUT) when it is done, where STATUS is the returned error
code of the process and OUTPUT is its stdout output."
  (with-temp-buffer
    (cons (or (apply #'call-process command nil t nil args)
              -1)
          (string-trim (buffer-string)))))


(defface +eshell-prompt-pwd '((t (:inherit font-lock-constant-face)))
  "TODO"
  :group 'eshell)

(defface +eshell-prompt-git-branch '((t (:inherit font-lock-builtin-face)))
  "TODO"
  :group 'eshell)

(defun +eshell--current-git-branch ()
  ;; TODO Refactor me
  (cl-destructuring-bind (status . output)
      (doom-call-process "git" "symbolic-ref" "-q" "--short" "HEAD")
    (if (equal status 0)
        (format " [%s]" output)
      (cl-destructuring-bind (status . output)
          (doom-call-process "git" "describe" "--all" "--always" "HEAD")
        (if (equal status 0)
            (format " [%s]" output)
          "")))))

(defun +eshell-default-prompt-fn ()
  "Generate the prompt string for eshell. Use for `eshell-prompt-function'."
  (require 'shrink-path)
  (concat "\n -> "
	  (let ((pwd (eshell/pwd)))
            (propertize pwd
                        'face '+eshell-prompt-pwd))
          (propertize (+eshell--current-git-branch)
                      'face '+eshell-prompt-git-branch)
          "\n"
          (propertize " λ" 'face (if (zerop eshell-last-command-status) 'success 'error))
          " "))

(defun bb-eshell-projectile-here ()
  (interactive)
  (let ((project (projectile-project-root)))
    (if project
        (projectile-with-default-dir project (eshell-toggle))
      (eshell-toggle))))

(setq eshell-banner-message
      '(format "%s %s\n"
               (propertize (format " %s " (string-trim (buffer-name)))
                           'face 'mode-line-highlight)
               (propertize (current-time-string)
                           'face 'font-lock-keyword-face))
      eshell-scroll-to-bottom-on-input 'all
      eshell-scroll-to-bottom-on-output 'all
      eshell-buffer-shorthand t
      eshell-kill-processes-on-exit t
      eshell-hist-ignoredups t
      ;; don't record command in history if prefixed with whitespace
      ;; TODO Use `eshell-input-filter-initial-space' when Emacs 25 support is dropped
      eshell-input-filter (lambda (input) (not (string-match-p "\\`\\s-+" input)))
      ;; em-prompt
      eshell-prompt-regexp "^.* λ "
      eshell-prompt-function #'+eshell-default-prompt-fn
      ;; em-glob
      eshell-glob-case-insensitive t
      eshell-error-if-no-glob t)

(add-hook 'eshell-mode-hook
  (defun +eshell-remove-fringes-h ()
    (set-window-fringes nil 0 0)
    (set-window-margins nil 1 nil)))

(add-hook 'eshell-mode-hook
  (defun +eshell-enable-text-wrapping-h ()
    (visual-line-mode +1)
    (set-display-table-slot standard-display-table 0 ?\ )))

(add-hook 'eshell-mode-hook #'hide-mode-line-mode)
