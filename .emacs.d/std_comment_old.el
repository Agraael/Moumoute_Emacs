;;
;; StdComment.el for Emacs in ~/Emacs
;;
;; Made by Frederic Denis
;; Login   <fred@epita.fr>
;;
;; Started on  Thu Sep  9 23:34:05 1993 Frederic Denis
;; Last Update Fri Aug 11 14:52:24 2017 Kraken
;;
;; Based on Comment routines by Isaac
;;


;;; Code:
(defvar HOME (getenv "MOME"))

(if (file-exists-p (concat HOME "/.emacs.d//php-mode.el"))
    (load-file (concat HOME "/.emacs.d/php-mode.el")))

(add-to-list 'auto-mode-alist (cons "\\.php[0-9]*$" 'php-mode))

(global-set-key (kbd "C-c h") 'update-std-header)
(global-set-key	(kbd "C-c C-d") 'do_insert_time)
(global-set-key	(kbd "C-c C-h") 'std-file-header)


(setq header-made-by	"Made by "
      header-login	"Login   "
      header-login-beg	"<"
      header-login-mid	"@"
      header-login-end	">"
      header-started	"Started on  "
      header-updated    "Updated on  "
      header-last	"Last Update "
      header-for	" for "
      header-in		" in "
      domaine-name	"epitech.eu")
(if (setq user-nickname (getenv "USER_NICKNAME"))
    t
  (setq user-nickname (user-full-name))
  )

(setq write-file-hooks (cons 'update-std-header write-file-hooks))

(setq std-c-alist               '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-css-alist             '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-cpp-alist             '( (cs . "//") (cc . "// ") (ce . "//") )
      std-pov-alist             '( (cs . "//") (cc . "// ") (ce . "//") )
      std-java-alist            '( (cs . "//") (cc . "// ") (ce . "//") )
      std-latex-alist           '( (cs . "%%") (cc . "%% ") (ce . "%%") )
      std-lisp-alist            '( (cs . ";;") (cc . ";; ") (ce . ";;") )
      std-xdefault-alist        '( (cs . "!!") (cc . "!! ") (ce . "!!") )
      std-pascal-alist          '( (cs . "{ ") (cc . "   ") (ce . "}" ) )
      std-makefile-alist        '( (cs . "##") (cc . "## ") (ce . "##") )
      std-text-alist            '( (cs . "##") (cc . "## ") (ce . "##") )
      std-fundamental-alist     '( (cs . "  ") (cc . "   ") (ce . "  ") )
      std-html-alist            '( (cs . "<!--") (cc . "  -- ") (ce . "-->"))
      std-php-alist		'( (cs . "#!/usr/local/bin/php\n<?php") (cc . "// ")(ce . "//"))
      std-nroff-alist           '( (cs . "\\\"") (cc . "\\\" ") (ce . "\\\""))
      std-sscript-alist         '( (cs . "#!/bin/sh")  (cc . "## ") (ce . "##"))
      std-perl-alist            '( (cs . "#!/usr/local/bin/perl -w")  (cc . "## ")(ce . "##"))
      std-cperl-alist           '( (cs . "#!/usr/local/bin/perl -w")  (cc . "## ")(ce . "##"))
      )


(setq std-modes-alist '(("C"                    . std-c-alist)
			("C/l"                  . std-c-alist)
                        ("CSS"                  . std-c-alist)
                        ("PoV"                  . std-pov-alist)
                        ("C++"                  . std-cpp-alist)
                        ("C++/l"                . std-cpp-alist)
                        ("Lisp"                 . std-lisp-alist)
                        ("Lisp Interaction"     . std-lisp-alist)
                        ("Emacs-Lisp"           . std-lisp-alist)
                        ("Fundamental"          . std-fundamental-alist)
                        ("Shell-script"         . std-sscript-alist)
                        ("Makefile"             . std-makefile-alist)
                        ("BSDmakefile"          . std-makefile-alist)
                        ("GNUmakefile"          . std-makefile-alist)
                        ("Perl"                 . std-cperl-alist)
                        ("CPerl"                . std-cperl-alist)
                        ("xdefault"             . std-xdefault-alist)
                        ("Java"                 . std-java-alist)
			("Javascript"           . std-java-alist)
			("Java/l"               . std-java-alist)
                        ("latex"                . std-latex-alist)
                        ("Pascal"               . stdp-ascal-alist)
                        ("Text"                 . std-text-alist)
                        ("HTML"                 . std-html-alist)
			("PHP"                  . std-php-alist)
                        ("Nroff"                . std-nroff-alist)
                        ("TeX"                  . std-latex-alist)
                        ("LaTeX"                . std-latex-alist))
      )

(defun std-get (a)
  (interactive)
  (cdr (assoc a (eval (cdr (assoc mode-name std-modes-alist)))))
  )

(defun update-std-header ()
  "Updates std header with last modification time & owner.\n(According to mode)"
  (interactive)
  (save-excursion
    (if (buffer-modified-p)
        (progn
          (goto-char (point-min))
          (if (search-forward header-last nil t)
              (progn
					;               (delete-region (point-at-bol) (point-at-eol))
                (delete-region
                 (progn (beginning-of-line) (point))
                 (progn (end-of-line) (point)))
                (insert-string (concat (std-get 'cc)
                                       header-last
                                       (current-time-string)
                                       " "
                                       user-nickname))
                (message "Last modification header field updated."))))))
  nil)

(defun std-file-header ()
  "Puts a standard header at the beginning of the file.\n(According to mode)"
  (interactive)
  (goto-char (point-min))
  (let ((projname "toto")(location "tiuti"))
    (setq projname (read-from-minibuffer
		    (format "Type project name (RETURN to quit) : ")))
    (setq location (getenv "PWD"))

    (insert (std-get 'cs))
    (newline)
    (insert (concat (std-get 'cc)
		    (buffer-name)
		    header-for
		    projname
		    header-in
		    location))
    (newline)
    (insert (std-get 'cc))
    (newline)
    (insert (concat (std-get 'cc) header-made-by user-nickname))
    (newline)
    (insert (concat (std-get 'cc)
		    header-login
		    header-login-beg
		    ;;(getenv "USER")
        "cedric.cescutti"
		    header-login-mid
		    domaine-name
		    header-login-end))
    (newline)
    (insert (std-get 'cc))
    (newline)
    (insert (concat (std-get 'cc)
		    header-started
		    (current-time-string)
		    " "
		    user-nickname))
    (newline)
    (insert (concat (std-get 'cc)
		    header-last
		    (current-time-string)
		    " "
		    user-nickname))
    (newline)
    (insert (std-get 'ce))
    (newline)))

(defun insert-std-vertical-comments ()
  "Inserts vertical comments (according to mode)."
  (interactive)
  (beginning-of-line)
  (insert (std-get 'cs))
  (newline)
  (let ((ok t)(comment ""))
    (while ok
      (setq comment (read-from-minibuffer
		     (format "Type comment (RETURN to quit) : ")))
      (if (= 0 (length comment))
	  (setq ok nil)
	(progn
	  (insert (concat (std-get 'cc) comment))
	  (newline)))))
  (insert (std-get 'ce))
  (newline))

(defun std-toggle-comment ()
  "Toggles line comment on or off (according to mode)."
  (interactive)
  (save-excursion
    (let (beg end)
      (beginning-of-line)
      (setq beg (point))
      (end-of-line)
      (setq end (point))
      (save-restriction
	(if (not (equal beg end))
	    (progn
	      (narrow-to-region beg end)
	      (goto-char beg)
	      (if (search-forward (std-get 'cs) end t)
		  (progn
		    (beginning-of-line)
		    (replace-string (std-get 'cs) "")
		    (replace-string (std-get 'ce) ""))
		(progn
		  (beginning-of-line)
		  (insert (std-get 'cs))
		  (end-of-line)
		  (insert (std-get 'ce)))))))))
  ;;  (indent-according-to-mode)
  (indent-for-tab-command)
  (next-line 1))

;;; Added by Eole Wednesday May 29 2002,  1:33:55
;;; Extended bindings for this package and for commenting code

(global-set-key (kbd "C-c h") 'update-std-header)
(global-set-key (kbd "C-c C-h") 'std-file-header)

;;;; Generating local keymaps for exotics modes.

;;; In CPerl mode, C-c C-h is used to do some help.
;;; so it is C-c C-h h
;;; For working, it requires info pages about perl
(add-hook 'cperl-mode-hook
	  '(lambda ()
	     (define-key cperl-mode-map (kdb "C-c C-h")
	       'std-file-header)))

;;; Added by Kraken Fri Oct 14 20:39:30 2016
;;; Extended bindings for this package and for commenting code

(defun std-file-update ()
  "Puts a standard header at the beginning of the file.\n(According to mode)"
  (interactive)
  (let ((detail "sauce") (location "lol"))
    (setq detail (read-from-minibuffer
		  (format "Type update detail (RETURN to quit) : ")))
    (setq location (getenv "PWD"))

    (insert (std-get 'cs))
    (newline)
    (insert (concat (std-get 'cc)
		    (buffer-name)
		    header-in
		    location))
    (newline)
    (insert (std-get 'cs))
    (newline)
    (insert (concat (std-get 'cc)
		    header-updated
		    (current-time-string)
		    " "
		    user-nickname))
    (newline)
    (insert (std-get 'cs))
    (newline)
    (insert (concat (std-get 'cc)
		    "Detail: "
		    detail))
    (newline)
    (insert (std-get 'ce))
    (newline)))

(global-set-key	(kbd "C-c C-y") 'std-file-update)
