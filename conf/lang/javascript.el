(setq js-indent-level 2)

(add-hook 'js-mode-hook '(lambda ()
                                   (require 'auto-complete)
                                   (auto-complete-mode t)
                                   ))

