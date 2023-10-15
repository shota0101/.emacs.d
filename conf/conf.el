;; 一行に収まらない場合に，単語単位で改行して表示
(global-visual-line-mode)

;; ------------------------------------------------------------------------
;; @ from gnupack

;; ------------------------------------------------------------------------
;; @ buffer

;; バッファ画面外文字の切り詰め表示
(setq truncate-lines nil)

;; ウィンドウ縦分割時のバッファ画面外文字の切り詰め表示
(setq truncate-partial-width-windows t)

;; 同一バッファ名にディレクトリ付与
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ------------------------------------------------------------------------
;; @ fringe

;; バッファ中の行番号表示
(global-linum-mode t)

;; 行番号のフォーマット
;; (set-face-attribute 'linum nil :foreground "red" :height 0.8)
(set-face-attribute 'linum nil :height 0.8)
(setq linum-format "%4d")

;; ------------------------------------------------------------------------
;; @ modeline

;; cp932エンコード時の表示を「P」とする
(coding-system-put 'cp932 :mnemonic ?P)
(coding-system-put 'cp932-dos :mnemonic ?P)
(coding-system-put 'cp932-unix :mnemonic ?P)
(coding-system-put 'cp932-mac :mnemonic ?P)


;; ------------------------------------------------------------------------
;; @ cursor

;; カーソル点滅表示
;; (blink-cursor-mode 0)

;; スクロール時のカーソル位置の維持
(setq scroll-preserve-screen-position t)

;; スクロール行数（一行ごとのスクロール）
(setq vertical-centering-font-regexp ".*")
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

;; 画面スクロール時の重複行数
(setq next-screen-context-lines 1)


;; ------------------------------------------------------------------------
;; @ hiwin-mode
;; (require 'hiwin)

;; ;; hiwin-modeを有効化
;; (hiwin-activate)

;; ;; 非アクティブウィンドウの背景色を設定
;; (set-face-background 'hiwin-face "gray80")


;; ------------------------------------------------------------------------
;; @ tabbar

;; (require 'tabbar)

;; ;; tabbar有効化
;; (tabbar-mode)

;; ;; タブ切替にマウスホイールを使用（0：有効，-1：無効）
;; (tabbar-mwheel-mode -1)

;; ;; タブグループを使用（t：有効，nil：無効）
;; (setq tabbar-buffer-groups-function nil)

;; ;; ボタン非表示
;; (dolist (btn '(tabbar-buffer-home-button
;;                tabbar-scroll-left-button
;;                tabbar-scroll-right-button))
;;   (set btn (cons (cons "" nil) (cons "" nil))))

;; ;; タブ表示 一時バッファ一覧
;; (defvar tabbar-displayed-buffers
;;   '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*"
;;     "*Faces*" "*Apropos*" "*Customize*" "*shell*" "*Help*")
;;   "*Regexps matches buffer names always included tabs.")

;; ;; 作業バッファの一部を非表示
;; (setq tabbar-buffer-list-function
;;       (lambda ()
;;         (let* ((hides (list ?\  ?\*))
;;                (re (regexp-opt tabbar-displayed-buffers))
;;                (cur-buf (current-buffer))
;;                (tabs (delq
;;                       nil
;;                       (mapcar
;;                        (lambda (buf)
;;                          (let ((name (buffer-name buf)))
;;                            (when (or (string-match re name)
;;                                      (not (memq (aref name 0) hides)))
;;                              buf)))
;;                        (buffer-list)))))
;;           (if (memq cur-buf tabs)
;;               tabs
;;             (cons cur-buf tabs)))))

;; ;; キーバインド設定
;; (global-set-key (kbd "<C-tab>")   'tabbar-forward-tab)
;; (global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)

;; ;; タブ表示欄の見た目（フェイス）
;; (set-face-attribute 'tabbar-default nil
;;                     :background "SystemMenuBar")

;; ;; 選択タブの見た目（フェイス）
;; (set-face-attribute 'tabbar-selected nil
;;                     :foreground "red3"
;;                     :background "SystemMenuBar"
;;                     :box (list
;;                           :line-width 1
;;                           :color "gray80"
;;                           :style 'released-button)
;;                     :overline "#F3F2EF"
;;                     :weight 'bold
;;                     :family "ＭＳ Ｐゴシック"
;;                     )

;; ;; 非選択タブの見た目（フェイス）
;; (set-face-attribute 'tabbar-unselected nil
;;                     :foreground "black"
;;                     :background "SystemMenuBar"
;;                     :box (list
;;                           :line-width 1
;;                           :color "gray80"
;;                           :style 'released-button)
;;                     :overline "#F3F2EF"
;;                     :family "ＭＳ Ｐゴシック"
;;                     )

;; ;; タブ間隔の調整
;; (set-face-attribute 'tabbar-separator nil
;;                     :height 0.1)


;; ------------------------- about encoding -------------------------
;; Windows向けのEmacsは標準では文字化けを起こしませんが
;; 新規ファイル作成時の文字コードがShift-JISになってしまいます

;; 新規ファイル作成時の文字コードを変更するためには
;; (set-default-coding-system 'utf8)
;; と指定することで変更が可能ですが
;; (prefer-coding-system 'utf-8)
;; でも内部でset-default-coding-systemが実行されるようになっています

;; しかしこのprefer-coding-systemを実行すると
;; defalt-file-coding-systemの値も変更されてしまいます
;; そのため次の設定も必ず行うこと
;; (set-file-name-coding-system 'cp932)
;; ------------------------- about encoding -------------------------

;; Windowsの場合のファイル名の設定
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))

;; Max OS X の場合のファイル名の設定
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))


;; ------------------------------------------------------------------------
;; @ frame

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; 複数ウィンドウを開かないようにする
(setq ns-pop-up-frames nil)


;; ------------------------------------------------------------------------
;; @ modeline

;; 行番号の表示
(line-number-mode t)
(line-number-mode nil)

;; 列番号の表示
(column-number-mode t)

;; 日付の表示
;; (setq display-time-day-and-date t)

;; 時刻の表示
(require 'time)
(setq display-time-24hr-format t)
(setq display-time-string-forms '(24-hours ":" minutes))
(display-time-mode t)

;; ファイルサイズを表示
(size-indication-mode t)

;; ------------------------------------------------------------------------
;; @ backup

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
;; (setq auto-save-default nil)

;; ;; 変更ファイルの番号つきバックアップ
;; (setq version-control nil)

;; ;; 編集中ファイルのバックアップ
;; (setq auto-save-list-file-name nil)
;; (setq auto-save-list-file-prefix nil)

;; ;; 編集中ファイルのバックアップ先
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))

;; ;; 編集中ファイルのバックアップ間隔（秒）
(setq auto-save-timeout 60)

;; ;; 編集中ファイルのバックアップ間隔（打鍵）
;; (setq auto-save-interval 100)

;; ;; バックアップ世代数
;; (setq kept-old-versions 1)
;; (setq kept-new-versions 2)

;; ;; 上書き時の警告表示
;; ;; (setq trim-versions-without-asking nil)

;; ;; 古いバックアップファイルの削除
;; (setq delete-old-versions t)


;; バックアップディレクトリを指定する
(add-to-list 'backup-directory-alist
	     (cons "." "~/emacs-temp/backups/"))

;; オートセーブディレクトリを指定する
;; (setq auto-save-file-name-transforms
;;       '((".*" ,(expand-file-name "~/emacs-temp/auto-save/") t)))


;; ------------------------------------------------------------------------------------------


;; bashを実行可能にする
(defun bash ()
  "Run cygwin bash in shell mode."
  (interactive)
  (let ((explicit-shell-file-name "C:/cygwin/bin/bash"))
    (call-interactively 'shell)))

;; 変数の値を変更(この場合はコマンドプロンプトの代わりにbashが起動する
;; (setq shell-file-name "C:/cygwin/bin/bash") 


;; インデント設定
(add-hook 'text-mode-hook
	  (lambda ()
	    (setq tab-width 8)
	    (setq indent-tabs-mode t)
	    (setq c-basic-offset 4)))


;; 右端で折り返す場合は単語ごとに区切る
;; (global-visual-line-mode 1)
;; 右端では行を折り返さない
(set-default 'truncate-lines t)


;; ------------------------------------------------------------------------------------------
;; ssh
(require 'tramp)
(setq tramp-default-method "ssh")
;; C-x C-f /ssh:user@hostname#port:path

;; ------------------------------------------------------------------------------------------
;; 大文字小文字の変換

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; 下記の機能を有効にする
;; C-x C-u：リージョンを大文字に変換
;; C-x C-l：リージョンを小文字に変換

;; -------------------------------------------------------------------------------
;; JIS配列のMacではバックスラッシュを入力できないため、修正
;; https://qiita.com/katoken-0215/items/bb20c335eee1612c36e5
(define-key global-map [165] [92])
