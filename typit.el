;;; typit.el --- Typing game similar to tests on 10 fast fingers -*- lexical-binding: t; -*-
;;
;; Copyright © 2016 Mark Karpov <markkarpov@openmailbox.org>
;;
;; Author: Mark Karpov <markkarpov@openmailbox.org>
;; URL: https://github.com/typit
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.4"))
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

(defgroup typit nil
  "Cool typing game similar to tests on 10 fast fingers."
  :group  'games
  :tag    "Typit"
  :prefix "typit-"
  :link   '(url-link :tag "GitHub" "https://github.com/mrkkrp/typit"))

(provide 'typit)

;;; typit.el ends here
