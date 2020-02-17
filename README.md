# Typit

[![License GPL 3](https://img.shields.io/badge/license-GPL_3-green.svg)](http://www.gnu.org/licenses/gpl-3.0.txt)
[![MELPA](https://melpa.org/packages/typit-badge.svg)](https://melpa.org/#/typit)
[![CircleCI](https://circleci.com/gh/mrkkrp/typit/tree/master.svg?style=svg)](https://circleci.com/gh/mrkkrp/typit/tree/master)

This is a typing game for Emacs. In this game, you type words that are
picked randomly from N most frequent words in language you're practicing,
until time is up (by default it's one minute). Typit is quite similar to the
“10 fast fingers” tests, with the difference that it's playable and fully
configurable inside your Emacs.

![Typit typing](https://raw.githubusercontent.com/mrkkrp/typit/gh-pages/typit-typing.png)

## Installation

Download this package and place it somewhere, so Emacs can see it. Then put
`(require 'typit)` into your configuration file. Done!

It's available via MELPA, so you can just <kbd>M-x package-install RET typit
RET</kbd>.

## Usage

Type <kbd>M-x typit-basic-test RET</kbd> and Typit window should appear (see
the picture above). Timer will start when you start typing. When you are
done, the following statistics will appear:

![Typit results](https://raw.githubusercontent.com/mrkkrp/typit/gh-pages/typit-results.png)

If you're feeling like a master, you can try <kbd>M-x typit-advanced-test
RET</kbd> which uses 1000 most common English words (`typit-basic-test` uses
200 most common ones). You can also call a more general `typit-test` with a
numeric argument specifying how many words to use (note that default
dictionary has 1000 words total at the moment).

## Customization

There are some configuration parameters that allow you change things like:

* Faces controlling appearance of various UI elements
* Dictionary to use (e.g. this allows to switch between languages)
* Location of dictionary directory (usually it's automatically detected)
* Length of generated line of words (in characters)
* Test duration in seconds

To access these, type <kbd>M-x customize-group RET typit RET</kbd>.

## Contribution

If you would like to improve the package, PR and issues are welcome. Also,
it's OK to add dictionaries for other languages than English. To do so, you
need to create a text file named `your-language.txt` and put it under the
`dict` directory. That file should contain 1000 most common words from the
language, a word per line. Please make sure that it uses Unix-style (that
is, LF) end-of-line sequence and the file ends with a newline.

Once dictionary file is created, add it to the definition of `typit-dict`
customization parameter in `typit.el`. To try the game with a new language
added, change value of `typit-dict` accordingly via the customization
interface, `setq`, or with `let`-binding, and then run one of the commands
that start the game (`typit-basic-test`, `typit-advanced-test`, or
`typit-test`).

## License

Copyright © 2016–present Mark Karpov

Distributed under GNU GPL, version 3.
