;;; typit.el --- Typing game similar to tests on 10 fast fingers -*- lexical-binding: t; -*-
;;
;; Copyright © 2016 Mark Karpov <markkarpov@openmailbox.org>
;;
;; Author: Mark Karpov <markkarpov@openmailbox.org>
;; URL: https://github.com/typit
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.4") (f "0.18"))
;; Keywords: games
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the
;; Free Software Foundation, either version 3 of the License, or (at your
;; option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
;; Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is a typing game for Emacs.  In this game, you type words that are
;; picked randomly from N most frequent words in language you're practicing,
;; until time is up (by default it's one minute).  It's mostly quite similar
;; to the “10 fast fingers” tests, with the difference that it's playable
;; and fully configurable inside your Emacs.

;;; Code:

(require 'cl-lib)
(require 'f)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Settings & variables

(defgroup typit nil
  "Cool typing game similar to tests on 10 fast fingers."
  :group  'games
  :tag    "Typit"
  :prefix "typit-"
  :link   '(url-link :tag "GitHub" "https://github.com/mrkkrp/typit"))

(defface typit-title
  '((t (:inherit font-lock-contant-face)))
  "Face used to display Typit buffer title.")

(defface typit-timer
  '((t (:inherit font-lock-warning-face)))
  "Face used to display the timer.")

(defface typit-normal-text
  '((t (:inherit default)))
  "Face used to display words to type.")

(defface typit-current-word
  '((t (:inherit highlight)))
  "Face used to highlight current word.")

(defface typit-correct-char
  '((t (:foreground "spring green")))
  "Face used to color correctly typed characters.")

(defface typit-wrong-char
  '((t (:foreground "firebrick")))
  "Face used to color incorrectly typed characters.")

(defface typit-statistic
  '((t (:inherit font-lock-keyword-face)))
  "Face used to render names of statistical values after typing.")

(defface typit-value
  '((t (:inherit font-lock-constant-face)))
  "Face used to render statistical values after typing.")

(defcustom typit-dict "english.txt"
  "Name of dictionary file to use."
  :tag  "Dictionary to use"
  :type '(choice (const :tag "English" "english.txt")))

(defcustom typit-dict-dir
  (when load-file-name
    (f-slash (f-join (f-parent load-file-name) "dict")))
  "Path to directory with collection of dictionaries."
  :tag  "Directory with dictionary files"
  :type 'directory)

(defcustom typit-line-length 80
  "Length of line of words to use."
  :tag  "Length of line of words"
  :type 'integer)

(defvar typit--dict nil
  "Vector of words to use (from most common to least common).

If the value is NIL, it means that no dictionary has been loaded
yet.")

(defvar typit--dict-file nil
  "File name of currently loaded dictionary.

If no dictionary is loaded, it's NIL.")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Low-level functions

(defun typit--prepare-dict ()
  "Make sure that ‘typit--dict’ and ‘typit--dict-file’ are set."
  (let ((dict-file (f-expand typit-dict typit-dict-dir)))
    (when (or (not typit--dict-file)
              (not (f-same? typit--dict-file dict-file)))
      (setq typit--dict-file dict-file
            typit--dict
            (with-temp-buffer
              (insert-file-contents dict-file)
              (vconcat
               (split-string
                (buffer-substring-no-properties
                 (point-min)
                 (point-max))
                "\n" t "[[:space:]]*")))))))

(defun typit--pick-word (num)
  "Pick a word from ‘typit--dict’.

Use first NUM words from loaded dictionary (if NUM is bigger than
length of the dictionary, use all words).  All words in
‘typit--dict’ have approximately the same probability."
  (elt typit--dict (random (min num (length typit--dict)))))

(defun typit--generate-line (num)
  "Generate a line of appropriate length picking random words.

NUM is the number of words to use from loaded dictionary (if NUM
is bigger than length of the dictionary, use all words).

This uses words from ‘typit--dict’, which should be initialized
by the time the function is called.  Result is returned as a list
of strings with assumption that only one space is inserted
between each word (then total length should be close to
‘typit-line-length’)."
  (let ((words nil)
        (acc   0))
    (while (< acc typit-line-length)
      (let ((word (typit--pick-word num)))
        (setq acc
              (+ acc
                 (length word)
                 (if words 1 0)))
        (push word words)))
    (cdr words)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Top-level interface

;;;###autoload
(defun typit-test (words)
  "Run typing test with using WORDS most common words from dictionary.

Dictionary is an array of words in ‘typit-dict’.  By default it's
English words ordered from most common to least common.  You can
let-bind the variable and change it, it's recommended to use at
least 1000 words so ‘typit-advanced-test’ could work properly."
  (interactive "p")
  ;; TODO write me
  )

;;;###autoload
(defun typit-basic-test ()
  "Basic typing test (top 200 words).

See ‘typit-test’ for more information."
  (interactive)
  (typit-test 200))

;;;###autoload
(defun typit-advanced-test ()
  "Advanced typing test (top 1000 words)."
  (interactive)
  (typit-test 1000))

(provide 'typit)

;;; typit.el ends here