;;; flycheck-pos-tip-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (flycheck-pos-tip-mode) "flycheck-pos-tip" "flycheck-pos-tip.el"
;;;;;;  (22373 35506 960764 919000))
;;; Generated autoloads from flycheck-pos-tip.el

(defvar flycheck-pos-tip-mode nil "\
Non-nil if Flycheck-Pos-Tip mode is enabled.
See the command `flycheck-pos-tip-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `flycheck-pos-tip-mode'.")

(custom-autoload 'flycheck-pos-tip-mode "flycheck-pos-tip" nil)

(autoload 'flycheck-pos-tip-mode "flycheck-pos-tip" "\
A minor mode to show Flycheck error messages in a popup.

When called interactively, toggle `flycheck-pos-tip-mode'.  With
prefix ARG, enable `flycheck-pos-tip-mode' if ARG is positive,
otherwise disable it.

When called from Lisp, enable `flycheck-pos-tip-mode' if ARG is
omitted, nil or positive.  If ARG is `toggle', toggle
`flycheck-pos-tip-mode'.  Otherwise behave as if called
interactively.

In `flycheck-pos-tip-mode' show Flycheck's error messages in a
GUI tooltip.  Falls back to `flycheck-display-error-messages' on
TTY frames.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("flycheck-pos-tip-pkg.el") (22373 35507
;;;;;;  12736 302000))

;;;***

(provide 'flycheck-pos-tip-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flycheck-pos-tip-autoloads.el ends here
