;;
;; .myemacs for moumoute_emacs in /home/cedric
;;
;; Made by cedric
;; Login   <cedric@epitech.net>
;;
;; Started on  Thu Jun 30 15:47:09 2016 cedric
;; Last Update Tue Jan 10 16:46:31 2017 Cédric CESCUTTI
;;

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
  (add-to-list 'completion-ignored-extensions ext))

(global-linum-mode)

;; Ask y/n instead yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;Pour changer facilement de buffer
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;; Bold line

;;parentheses
(show-paren-mode)

;; molette souris
(mouse-wheel-mode t)

;;colonnes
(setq column-number-mode t)

;;affiche les espaces inutile
(setq-default show-trailing-whitespace t)
(set-face-attribute 'trailing-whitespace nil :background "color-236")

;; ça bug et je sais plus ce quer c'est
;; (setq display-time-next-load-average)

(global-set-key (kbd "<f7>") 'delete-trailing-whitespace)

;; Linum-mode
(global-set-key (kbd "<f6>") 'linum-mode)

;; Disable unusual bars
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(defun to-bottom () (interactive) "Recenter screen so that current"
       line is on the bottom of the screen
       (recenter -1))
(defun set-key-to-bottom () (interactive)
  (local-set-key "\C-l" 'to-bottom)
  )
(add-hook 'shell-mode-hook 'set-key-to-bottom)

;; Show tabs and too long lines

;; (custom-set-faces
;;  '(my-tab-face ((((class color)) (:foreground "color-238" :weight bold :underline t))) t)
;;  '(my-trailing-space-face ((((class color)) (:background "color-206"))) t)
;;  '(my-long-line-face ((((class color)) (:foreground "color-165"))) t))

;; les couleur sont remodifié dans .Moumoute_emacs ligne 465


;; aujouter l'affichage des tabulations et ligne trop longues -> choisir mode
(defun cc-mode-add-keywords (mode)
  (font-lock-add-keywords mode '(
				 ("\t+" (0 'my-tab-face append))
				 )))

;; a refaire avec la bonne regexp -> done dans le ficher highlight-80

;; (defvar 'long_line_var 1 "variable pour toggle on off l'affichage des lignes trop longue")
;; (setq long_line_var 1)

;; (defun long_line_toggle () "toggle long line keyword on the buffer(nil) or mode"
;;        (interactive)
;;        (if (= long_line_var 1)
;; 	   (font-lock-add-keywords nil '(("^.\\{80\\}\\(.+\\)$" (1 'my-long-line-face append))))
;; 	 (font-lock-remove-keywords nil '(("^.\\{80\\}\\(.+\\)$" (1 'my-long-line-face append))))
;; 	 )
;;        (font-lock-fontify-buffer)
;;        (if (= long_line_var 0)(setq long_line_var 1)(setq long_line_var 0))
;;        (if (= long_line_var 0)(message "Long_line_mode off")(message "Long_line_mode on"))
;;        )

;;(font-lock-remove-keywords)
(global-set-key (kbd "<f2>") 'highlight-80+-mode)

;; whitespace-line-colunm variable du nombre de lig
;; (global-set-key (kbd "<f2>") 'whitespace-mode)

;; (require 'whitespace)
;; (global-whitespace-mode t)
;; (setq whitespace-line-column 120)
;; (setq whitespace-global-modes '(c-mode c++-mode))

(cc-mode-add-keywords 'c-mode)
(cc-mode-add-keywords 'php-mode)
;;(cc-mode-add-keywords 'sh-mode)
(cc-mode-add-keywords 'python-mode)
(cc-mode-add-keywords 'perl-mode)
(cc-mode-add-keywords 'c++-mode)
(add-to-list 'auto-mode-alist (cons "\\.hpp\\'" 'c++-mode))
(add-to-list 'auto-mode-alist (cons "\\.cpp\\'" 'c++-mode))
(cc-mode-add-keywords 'emacs-lisp-mode)
