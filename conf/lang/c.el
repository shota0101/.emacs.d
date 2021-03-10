
;; c言語のスタイルを設定
;; (add-hook 'c-mode-common-hook
;; 	  (lambda ()
;; 	    (c-set-style "stroustrup")
;; 	    (setq indent-tabs-mode t)
;; 	    (setq c-tab-always-indent nil)
;; 	    )
;; 	  )


(add-hook 'c-mode-hook
	  (lambda ()
	    (setq tab-width 4)
	    ;; (setq indent-tabs-mode t)
	    (setq indent-tabs-mode nil)
	    (setq c-basic-offset 4)))


