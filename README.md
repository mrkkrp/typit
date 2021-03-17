# Typit

[![License GPL 3](https://img.shields.io/badge/license-GPL_3-green.svg)](http://www.gnu.org/licenses/gpl-3.0.txt)
[![MELPA](https://melpa.org/packages/typit-badge.svg)](https://melpa.org/#/typit)
![CI](https://github.com/mrkkrp/typit/workflows/CI/badge.svg?branch=master)

This is a typing game for Emacs. In this game, you type words that are
picked randomly from the most frequent words in the language you are
practicing, until time is up (by default it is one minute). Typit is similar
to the “10 fast fingers” tests, with the difference that it is playable and
fully configurable from your Emacs.

![Typit typing](https://raw.githubusercontent.com/mrkkrp/typit/gh-pages/typit-typing.png)

## Installation

The package is available via MELPA, so you can just type `M-x
package-install RET typit RET`.

If you would like to install the package manually, download or clone it and
put on Emacs' `load-path`. Then you can require it in your init file like
this:

```emacs-lisp
(require 'typit)
```

## Usage

Type `M-x typit-basic-test RET` and the Typit window should appear. The
timer will start once you begin typing. When you are done, some statistics
will be displayed:

![Typit results](https://raw.githubusercontent.com/mrkkrp/typit/gh-pages/typit-results.png)

If you feel like a master, you can try `M-x typit-advanced-test RET` which
uses the 1000 most common English words (`typit-basic-test` uses the 200
most common words). You can also call the more general `typit-test` with a
numeric argument specifying how many words to use (note that the default
dictionary has 1000 words in total at the moment).

## Customization

There are some configuration parameters that allow you to change things
like:

* Faces that control the appearance of various UI elements
* The dictionary to use (this allows us to switch between languages)
* The location of the dictionary directory
* The length of the generated line of words (in characters)
* The duration of the test in seconds

To access these, type `M-x customize-group RET typit RET`.

## Contribution

If you would like to improve this package, PR and issues are welcome. Also,
it is OK to add dictionaries for other languages than English. To do so, you
need to create a text file named `your-language.txt` and put it under the
`dict` directory. That file should contain the 1000 most common words of the
language, a word per line. Please make sure that it uses the Unix-style
(that is, LF) end-of-line sequence and that the file ends with a newline.
Once the dictionary file is created, add it to the definition of the
`typit-dict` customization parameter in `typit.el`. To try the game with the
new language added, change the value of `typit-dict` accordingly via the
customization interface, `setq`, or with a `let`-binding, and then run one
of the commands that start the game (`typit-basic-test`,
`typit-advanced-test`, or `typit-test`).

## License

Copyright © 2016–present Mark Karpov

Distributed under GNU GPL, version 3.
