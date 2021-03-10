
;; 透明化，ウィンドウの位置や大きさの指定
(setq default-frame-alist
      (append
       '(
	 (alpha . 0.95) ; manoj-dark
	 (top . 0)
	 (left . 0)
	 (width . 128)
	 (height . 30)
	 ) default-frame-alist) )
(setq initial-frame-alist default-frame-alist)


;; Mac用フォント設定
;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/
(set-face-attribute 'default nil
		    ;; :family "Meiryo" ;; font
		    :family "Osaka" ;; font
		    ;; :height 140)    ;; font size;; 日本語
		    :height 200)    ;; font size;; 日本語

;; ↓ターミナルで開くとエラーになる
;; (set-fontset-font
;;  nil 'japanese-jisx0208
;;   ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;;   ;; (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font
;;   (font-spec :family "Osaka")) ;; font
;; ------------------------------------------------------------------------------------------
;; 透明度を変更するキーバインド

(global-set-key "\C-c1" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 10)))

(global-set-key "\C-c2" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 20)))

(global-set-key "\C-c3" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 30)))

(global-set-key "\C-c4" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 40)))

(global-set-key "\C-c5" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 50)))

(global-set-key "\C-c6" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 60)))

(global-set-key "\C-c7" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 70)))

(global-set-key "\C-c8" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 80)))

(global-set-key "\C-c9" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 90)))

(global-set-key "\C-c0" '(lambda ()
			   (interactive)
			   (set-frame-parameter nil 'alpha 100)))
