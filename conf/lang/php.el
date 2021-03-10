
(add-to-list 'load-path "~/.emacs.d/conf/lang/php" )

;; php-mode
(load-library "php-mode")
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する
(when (require 'php-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . php-mode))
  (setq php-search-url "http://jp.php.net/ja/")
  (setq php-manual-url "http://jp.php.net/manual/ja/"))

;; (setq php-mode-force-pear t) ;PEAR規約のインデント設定にする

;; php-completion
(defun php-completion-hook ()
  (when (require 'php-completion nil t)
(php-completion-mode t)
    (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
    (when (require 'auto-complete nil t) ;auto-completeを使っている時
      (make-variable-buffer-local 'ac-sources)
      (add-to-list 'ac-sources 'ac-source-php-completion)
      (auto-complete-mode t))))
;; php-mode-hook
(add-hook 'php-mode-hook 'php-completion-hook)



;; インデント設定
;; (add-hook 'php-mode-hook
;; 	  (lambda ()
;; 	    ;; タブでインデント
;; 	    (setq indent-tabs-mode t)
;; 	    (setq tab-width 4)

;; 	    (setq c-basic-offset 4)
;; 	    ;; 配列内のインデントは標準では開き括弧の位置になっている
;; 	    ;; '+ は c-basic-offset の値を利用するという指定
;; 	    (c-set-offset 'arglist-intro '+)
;; 	    ;; 閉じ括弧のインデントを指定
;; 	    ;; 0はインデントなしという設定
;; 	    (c-set-offset 'arglist-close '0)

;; 	    (c-set-offset 'case-label' 4)
;; 	    (c-set-offset 'arglist-intro' 0)
;; 	    (c-set-offset 'arglist-cont-nonempty' 4)
;; 	    (c-set-offset 'arglist-close' 0)

;; 	    ;; hs-minor-modeを開始する
;; 	    (hs-minor-mode)
;; 	    )
;; 	  )
