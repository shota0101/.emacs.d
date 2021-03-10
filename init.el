
;; ~/.emacsが存在するときは、init.elが読み込まれないので要注意


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/conf/custom-set")
(load "~/.emacs.d/conf/appearance")
(load "~/.emacs.d/conf/key-bindings")
(load "~/.emacs.d/conf/mode/i-search")
(load "~/.emacs.d/conf/packages/package")
(load "~/.emacs.d/conf/lang/lang")

(load "~/.emacs.d/conf/conf")
(load "~/.emacs.d/conf/macro")

(load "~/.emacs.d/conf/key-bindings-hammerspoon.el")
