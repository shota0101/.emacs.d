
(add-to-list 'load-path "~/.emacs.d/conf/lang/processing2-emacs/")
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))

;; (setq processing-location "~/Processing/processing-2.2.1/processing")
;; (setq processing-application-dir "~/Processing/processing-2.2.1")
;; (setq processing-sketch-dir "~/Documents/Processing")

;; (require 'auto-complete)
;; (global-auto-complete-mode t)
