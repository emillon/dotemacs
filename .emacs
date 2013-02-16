(add-to-list 'load-path "~/.emacs.d/site-lisp/")

; General configuration
(setq font-lock-maximum-decoration t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(show-paren-mode)
(setq inhibit-startup-screen t)
(setq show-paren-mode t)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq custom-file "~/.emacs-custom.el")
(load custom-file)

; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
    (with-current-buffer
            (url-retrieve-synchronously
                     "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
                (goto-char (point-max))
                    (eval-print-last-sexp)))

(el-get 'sync)

(setq el-get-sources
      '(el-get
	(:name undo-tree :type builtin)
	evil
	)
      )

; evil
(require 'evil)
(evil-mode 1)
(define-key evil-insert-state-map (kbd "j k") 'evil-normal-state)

; Always split vertically
(setq split-height-threshold nil)

; ERC
(require 'erc)
(require 'tls)
(setq erc-modules '(autojoin button completion fill irccontrols keep-place list
                    log match menu move-to-prompt netsplit networks noncommands
                    readonly ring services smiley stamp track))
(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part t)
(setq erc-auto-query 'window-noselect)

; gnugo
(require 'gnugo)
(require 'gnugo-xpms)

; color
(require 'color-theme)
(require 'color-theme-molokai)
(color-theme-molokai)

; org
(require 'org)
(require 'org-notmuch)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time
      calendar-week-start-day 1
      calendar-day-name-array ["Dimanche" "Lundi" "Mardi" "Mercredi"
                               "Jeudi" "Vendredi" "Samedi"]
      calendar-month-name-array ["Janvier"   "Février" "Mars"     "Avril"
                                 "Mai"       "Juin"    "Juillet"  "Août"
                                 "Septembre" "Octobre" "Novembre" "Décembre"]
      org-agenda-files '("~/org/")
      )

; Use default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "sensible-browser"
      )
