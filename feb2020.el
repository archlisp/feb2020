;;; feb2020.el --- Emacs stuff -*- lexical-binding: t; -*-
;;; feb2020.el -- Summary:
;; Package-Requires: ((dash "2.17.0") (dash-functional "1.2.0") (emacs "24") (s "1.12.0") (ht "2.3"))
;;; Commentary:
;;; Code:

(defun read-lines (file-path)
  "Return a list of lines of a file at `FILE-PATH'."
  (with-temp-buffer
    (insert-file-contents file-path)
    (split-string (buffer-string) "\n" t)))

(defun parse-input (input)
  "`INPUT'."
  (let ((rules (butlast input))
        (sentence (car (last input))))
    (list (mapcar 'parse-rule rules)
          sentence)))

(defun parse-rule (rule)
  "`RULE'."
  (s-split " *=> *" rule))

;; (defun apply-rule (sentence rule)
;;   "`SENTENCE', `RULE'."
;;   (cl-destructuring-bind (before after) rule
;;     (s-matched-positions-all before sentence)
;;     (replace-at-indices)))

(defun replace-at-indices (string start end replacement)
  (let ((begin (substring string 0 start))
        (end (substring string end)))
    (s-concat begin replacement end)))

;;; feb2020.el ends here
(provide 'feb2020)
