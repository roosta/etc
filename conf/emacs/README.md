![emacs_title](https://raw.githubusercontent.com/roosta/assets/master/etc/emacs_title.png)

## Spacemacs inspired emacs configuration

**ATTENTION:** I've more or less stopped maintaining this config, as I've gone back
to vim. Got tired of trying to get emacs to act like vim

This is my Emacs configuration. As a vimmer I initially chose
[Spacemacs](https://github.com/syl20bnr/spacemacs) as my framework around Emacs
but have since moved away from it, to instead setup my own configuration. I did
so as a learning experience but I borrow a lot from Spacemacs.

This configuration is geared toward Arch Linux and I haven't tested it on any
other OS or distribution.

The configuration is a work in progress, which I guess it will always be but I
haven't setup everything I want yet, so language support is a bit sparse.

Currently I got these things set up more or less how I like it.

-   Clojure
-   Common lisp
-   Javascript
-   Markdown / org
-   And various language agnostic utilities like
    -   [Evil](https://github.com/emacs-evil/evil)
    -   [Git](https://github.com/magit/magit)
    -   [Ivy](https://github.com/abo-abo/swiper)
    -   [Flycheck](https://github.com/flycheck/flycheck)
    -   [Company](https://github.com/company-mode/company-mode)

I use [use-package](https://github.com/jwiegley/use-package) and [general](https://github.com/noctuid/general.el) as building blocks for packages and keybindings that tries to match that of Spacemacs.

## Terminal support

A focus for this configuration has been that it should work well inside a
terminal and tmux. See
[init-term.el](https://github.com/roosta/etc/blob/master/conf/emacs/.emacs.d/lisp/init-term.el)
for setup. I currently only use Emacs in the terminal despite suggestions
otherwise.

## Supported Emacs versions

This config should run on Emacs 24.4 and above but I have yet only tested it on
the latest Emacs version (26.2). It's quite possible various packages break
when using older emacs versions.

## Other requirements

Flycheck linters are required to be installed outside emacs for it to work. For
javascript you can call:
```shell
make npm-packages
```
For clojure I use a combination of
[clj-kondo](https://github.com/borkdude/clj-kondo) and
[joker](https://github.com/candid82/joker) and is installed via Arch linux user
repository (AUR), see [aur<sub>packages.txt</sub>](../../aur_packages.txt) and
`make install-aur-packages`

## Installation

Easiest way to install this config is to clone the repo:
```shell
git clone https://github.com/roosta/etc
```
`cd` into repository and call
```shell
stow emacs -t ~ -d conf
```
To link config to home. But I rather recommend that you cherry pick whatever
you like from this config. It's not really meant to be distributed, its my
personal config, and it is far from any kind of finished state. Not to mention
I'm a emacs noob.

## Updates

To update call git pull in the base `etc` folder and in Emacs call `mx
package-list-packages`, then `U`, followed by `x`

You should probably restart Emacs after updating so changes can take effect.

## Inspiration / resources

- [purcell/emacs.d: An Emacs configuration bundle with batteries included](https://github.com/purcell/emacs.d)
- [syl20bnr/spacemacs: A community-driven Emacs distribution - The best editor is neither Emacs nor Vim, it's Emacs **and** Vim!](https://github.com/syl20bnr/spacemacs)
- [hlissner/doom-emacs: An Emacs configuration for the stubborn martian vimmer](https://github.com/hlissner/doom-emacs)
- [bbatsov/prelude: Prelude is an enhanced Emacs 25.1+ distribution that should make your experience with Emacs both more pleasant and more powerful.](https://github.com/bbatsov/prelude/)
- [Quick Start emacs with evil • Personal blog site](http://evgeni.io/posts/quick-start-evil-mode/)
- [jwiegley/dot-emacs: My .emacs.el file and other personal Emacs goodies](https://github.com/jwiegley/dot-emacs)
- [Quick Start emacs with evil • Personal blog site](http://evgeni.io/posts/quick-start-evil-mode/)
- [How to build your own spacemacs · Samuel Barreto](https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/)
- [Emacs Config Redo - Evil & Use-Package &#x2013; λ ryan. himmelwright. net](http://ryan.himmelwright.net/post/emacs-update-evil-usepackage/)

## Misc

I also keep my old spacemacs config in this repo. [Check it
out](https://github.com/roosta/etc/tree/master/conf/spacemacs/.spacemacs.d) if
you are interested.
