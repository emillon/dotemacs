(add-to-list 'load-path "~/.emacs.d/site-lisp/")

; General configuration
(setq font-lock-maximum-decoration t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(setq inhibit-startup-screen t)
(setq show-paren-mode t)

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
