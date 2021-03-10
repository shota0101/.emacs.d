


(load "~/.emacs.d/conf/lang/csharp/csharp-mode-0.8.5")


;;; ; インデント設定
;; (add-hook 'csharp-mode-hook
;; 	  (lambda ()
;; 	    ;; タブでインデント
;; 	    (setq indent-tabs-mode nil)
;; 	    (setq tab-width 4)

;; 	    (setq c-basic-offset 4)
;; 	    ;; ;; 配列内のインデントは標準では開き括弧の位置になっている
;; 	    ;; ;; '+ は c-basic-offset の値を利用するという指定
;; 	    ;; (c-set-offset 'arglist-intro '+)
;; 	    ;; ;; 閉じ括弧のインデントを指定
;; 	    ;; ;; 0はインデントなしという設定
;; 	    ;; (c-set-offset 'arglist-close '0)

;; 	    ;; (c-set-offset 'case-label' 4)
;; 	    ;; (c-set-offset 'arglist-intro' 0)
;; 	    ;; (c-set-offset 'arglist-cont-nonempty' 4)
;; 	    ;; (c-set-offset 'arglist-close' 0)

;; 	    ;; ;; hs-minor-modeを開始する
;; 	    ;; (hs-minor-mode)
;; 	    )
;; 	  )



;; (require 'csharp-mode)

;; Cモード共通フック
(add-hook 'csharp-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil) ;インデントがスペースとタブの両方になってしまうので自分で追加
             (setq tab-width 4)		 ;〃

             (setq comment-column 40)
             (setq c-basic-offset 4)
             (font-lock-add-magic-number)
             ;; オフセットの調整
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'case-label '+)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             )
          )




