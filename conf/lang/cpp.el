


(add-hook 'c++-mode-hook
	  (lambda ()
	    ;; hs-minor-modeを開始する
	    (hs-minor-mode)
	    )
	  )

;; キーバインドの設定
(define-key c++-mode-map "\C-d" 'bookmark-set)
(define-key c++-mode-map (kbd "C-c C-d") 'widen)
(define-key c++-mode-map (kbd "C-c C-f") 'narrow-to-region)
(define-key c++-mode-map (kbd "C-c C-s") 'eshell-command)


