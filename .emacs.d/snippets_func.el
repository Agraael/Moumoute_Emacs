;;
;; EPITECH PROJECT, 2018
;;
;; File description:
;;
;;

;;; Code

(defun upfirst (s)
  (if (> (length s) 0)
      (concat (upcase (substring s 0 1)) (substring s 1))
    nil))

(defun downfirst (s)
  (if (> (length s) 0)
      (concat (downcase (substring s 0 1)) (substring s 1))
    nil))
