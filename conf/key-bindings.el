;; C-c C-a系が余ってる
;; C-c C-x系が余ってる
;; 意図せずにアプリケーションを終了させないように
(global-set-key (kbd "C-x C-z")  'kill-this-buffer)

;; ウィンドウをリサイズするためのショートカット
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?d)
               (enlarge-window-horizontally dx))
              ((= c ?a)
               (shrink-window-horizontally dx))
              ((= c ?s)
               (enlarge-window dy))
              ((= c ?w)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key (kbd "C-x C-r") 'window-resizer)

;; 現在時刻の挿入
(defun now ()
     (interactive)
     (insert (format-time-string "%Y-%m-%d_%H-%M-%S"))
)
(defun today ()
     (interactive)
     (insert (format-time-string "%Y-%m-%d"))
)
(define-key global-map [S-f5] 'today)
(define-key global-map [S-f6] 'now)

;; タブ文字の挿入
(defun insert-tab ()
     (interactive)
     (insert "\t")
)
(global-set-key (kbd "S-<tab>")  'insert-tab)
;; (global-set-key (kbd "<backtab>")  'insert-tab)
;; ↑backtabってどうやって入力するの？


;; 行のコピー・切り取り
;; http://akisute3.hatenablog.com/entry/20120412/1334237294
(defun copy-whole-line (&optional arg)
  "Copy current line."
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
    (kill-new "")
    (setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
        ((< arg 0)
         (save-excursion
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line (1+ arg))
                                       (unless (bobp) (backward-char))
                                       (point)))))
        (t
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line arg) (point))))))
  (message (substring (car kill-ring-yank-pointer) 0 -1)))

;; (global-set-key (kbd "C-h C-j") 'copy-whole-line) ;; 行全体のコピー
;; (global-set-key (kbd "C-h C-k") 'kill-whole-line) ;; 行全体の切り取り

;; カーソルの位置を維持したままスクロール
(defun scroll-up-in-place (n)
  (interactive "p")
  (previous-line n)
  (scroll-down n))
(global-set-key (kbd "s-<up>")  'scroll-up-in-place)
(defun scroll-down-in-place (n)
  (interactive "p")
  (next-line n)
  (scroll-up n))
(global-set-key (kbd "s-<down>")  'scroll-down-in-place)


(global-set-key (kbd "M-<up>")  'backward-paragraph)
(global-set-key (kbd "M-<left>") 'left-word)
(global-set-key (kbd "M-<right>") 'right-word)
(global-set-key (kbd "M-<down>")  'forward-paragraph)

(global-set-key (kbd "<home>")  'back-to-indentation)
(global-set-key (kbd "<end>")  'move-end-of-line)


;; ------------------------------------------------------------------------------------------
;; ファイルを再読込した際に確認をスキップ
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

;; ------------------------------------------------------------------------------------------
;; フレーム（ウィンドウ制御）
(global-set-key (kbd "C-x C-1")  'delete-other-windows)
(global-set-key (kbd "C-x C-2")  'split-window-below)
(global-set-key (kbd "C-x C-3")  'split-window-right)
(global-set-key (kbd "C-x C-0")  'delete-window)

(global-set-key (kbd "M-s M-w")  'windmove-up)
(global-set-key (kbd "M-s M-a")  'windmove-left)
(global-set-key (kbd "M-s M-s")  'windmove-down)
(global-set-key (kbd "M-s M-d")  'windmove-right)


;; 普通のエディタ風にカスタマイズ
;; (global-set-key "\C-v" 'yank)
(global-set-key "\C-z" 'undo)
;; (global-set-key "\C-s" 'save-buffer)
;; (global-set-key "\C-f" 'isearch-forward)
;; (global-set-key "\C-h" 'replace-string)
;; (global-set-key "\C-w" 'kill-this-buffer)
;; (global-set-key (kbd "<C-tab>")  'next-buffer)
;; (global-set-key (kbd "<C-S-tab>")  'previous-buffer)

;; misc
(global-set-key (kbd "C-x C-h") 'mark-whole-buffer)
(global-set-key (kbd "C-h C-u") 'goto-line)
(global-set-key (kbd "C-x 0") 'text-scale-adjust) ; 文字サイズを変更（デフォルトではC-x C-0）
; (global-set-key (kbd "C-c C-q") 'toggle-read-only) ; C-x C-qで同じfunctionが呼び出される
(global-set-key (kbd "C-r") 'toggle-truncate-lines) ; 行の折返しを切り替え
(global-set-key (kbd "C-c C-q") 'global-linum-mode) ; 行数の表示を切り替え
; (global-set-key (kbd "C-c C-s") 'shell) ; ターミナルを開く
(global-set-key (kbd "C-c C-s") 'shell-command) ; コマンドを1つだけ実行
(global-set-key (kbd "C-c C-a C-p") 'delete-horizontal-space) ; 空白の削除
;; (global-set-key (kbd "M-i") 'set-mark-command) ; 選択を開始する（C-@でも実行可能）

;; (defun next-line-10 ()
;;   (interactive)
;;   (next-line)
;;   (next-line)
;;   (next-line)
;;   (next-line)
;;   (next-line)
;;   (next-line)
;;   (next-line)
;;   (next-line)
;;   (next-line)
;;   (next-line)
;; )
;; (global-set-key (kbd "s-1")  'next-line-10)

;; (global-set-key (kbd "s-o") 'set-mark-command)

;; (global-set-key (kbd "s-j") 'left-word)
;; (global-set-key (kbd "s-l") 'right-word)
;; (global-set-key (kbd "s-i") 'backward-paragraph)
;; (global-set-key (kbd "s-k") 'forward-paragraph)

;; (global-set-key (kbd "s-a") 'left-char)
;; (global-set-key (kbd "s-d") 'right-char)
;; (global-set-key (kbd "s-w") 'previous-line)
;; (global-set-key (kbd "s-s") 'next-line)

;; (global-set-key (kbd "s-q") 'beginning-of-visual-line)
;; (global-set-key (kbd "s-e") 'end-of-visual-line)

;; (global-set-key (kbd "s-n") 'scroll-down-command)
;; (global-set-key (kbd "s-m") 'scroll-up-command)

