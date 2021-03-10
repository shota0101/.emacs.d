(load "~/.emacs.d/conf/lang/markdown/markdown-mode")

(global-set-key (kbd "s-M-1")  'markdown-insert-header-atx-1)
(global-set-key (kbd "s-M-2")  'markdown-insert-header-atx-2)
(global-set-key (kbd "s-M-3")  'markdown-insert-header-atx-3)
(global-set-key (kbd "s-M-4")  'markdown-insert-header-atx-4)
(global-set-key (kbd "s-M-5")  'markdown-insert-header-atx-5)
(global-set-key (kbd "s-M-6")  'markdown-insert-header-atx-6)
(global-set-key (kbd "s-(")  'markdown-insert-list-item) ;⌘⇧8で箇条書き
(global-set-key (kbd "C-h C-b")  'markdown-insert-bold)
;; (global-set-key (kbd "s-i")  'markdown-insert-italic)
(global-set-key (kbd "C-h C--")  'markdown-insert-hr) ;; 水平線（79個のハイフン）
(global-set-key (kbd "C-h C-y")  'markdown-insert-code) ;; ``を挿入
(global-set-key (kbd "C-h C-h")  'markdown-insert-gfm-code-block) ;; 言語指定で```を挿入


;; (global-set-key (kbd "C-h C-q")  'markdown-insert-blockquote) ;; 引用
(fset 'insert-blockquote
   [home ?> ? ])
(global-set-key (kbd "C-h C-q")  'insert-blockquote)

;; リンクの挿入
;; (global-set-key (kbd "C-h C-k")  'markdown-insert-link)
(fset 'markdown-url
   [?\[ ?\] ?\( ?\) left left left])
(global-set-key (kbd "C-h C-j")  'markdown-url)

(fset 'insert-three-backquote
   [?` ?` ?` return return ?` ?` ?` return up up])
(global-set-key (kbd "M-s-p")  'insert-three-backquote) ;; ```を挿入

(fset 'insert-hash-1
   [?\s-\M-1 ?\C-d ?\C-d])
(global-set-key (kbd "M-s M-1")  'insert-hash-1) ;; h1

(fset 'insert-hash-2
   [?\s-\M-2 ?\C-d ?\C-d ?\C-d])
(global-set-key (kbd "M-s M-2")  'insert-hash-2) ;; h2

(fset 'insert-hash-3
   [?\s-\M-3 ?\C-d ?\C-d ?\C-d ?\C-d])
(global-set-key (kbd "M-s M-3")  'insert-hash-3) ;; h3

(fset 'insert-hash-4
   [?\s-\M-4 ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d])
(global-set-key (kbd "M-s M-4")  'insert-hash-4) ;; h4

(fset 'insert-hash-5
   [?\s-\M-5 ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d])
(global-set-key (kbd "M-s M-5")  'insert-hash-5) ;; h5

(fset 'insert-hash-6
   [?\s-\M-6 ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d])
(global-set-key (kbd "M-s M-6")  'insert-hash-6) ;; h6

(fset 'insert-hyphen
   [home ?- ? ])
(global-set-key (kbd "C-h C-s")  'insert-hyphen) ;; 箇条書き

(fset 'insert-table
   [?| ?  ?l ?e ?f ?t ?  ?| ?\S-  ?r ?i ?g ?h ?t ?  ?| return ?| ?  ?: ?- ?: ?  ?| ?  ?: ?- ?: ?  ?| return ?| ?  ?l ?e ?f ?t ?  ?| ?\S-  ?r ?i ?g ?h ?t ?  ?| return up up up right right])
(global-set-key (kbd "C-h C-t")  'insert-table) ;; テーブル

(fset 'img
   [?< ?i ?m ?g ?  ?s ?r ?c ?= ?\" ?\" ?  ?w ?i ?d ?t ?h ?= ?\" ?7 ?0 ?0 ?\" ?> left left left left left left left left left left left left left left])
(global-set-key (kbd "C-h TAB")  'img) ;; imgタグ

;; リンクをコピー
(fset 'copy-markdown-link
   (kmacro-lambda-form [home ?\C-s ?\] ?\( right left ?\C-  ?\C-s ?\) left ?\s-c] 0 "%d"))
(global-set-key (kbd "C-h C-c")  'copy-markdown-link)

;; タスクを挿入
(fset 'insert-task
   "[ ] ")
(global-set-key (kbd "C-h C-n")  'insert-task)
(global-set-key (kbd "C-h <down>")  'insert-task)

;; タスクを完了にする
(fset 'mark-task-as-done
   [home ?\C-s ?\[ right backspace ?x ?\C-f ?\C-f])
(global-set-key (kbd "C-h C-b")  'mark-task-as-done)
(global-set-key (kbd "C-h <left>")  'mark-task-as-done)

;; 次の行で箇条書き
(fset 'markdown-hyphen
   [down ?\C-a ?\C-o ?- ? ])
(global-set-key (kbd "C-c C-w")  'markdown-hyphen)

;; 参考ページ
;; http://futurismo.biz/archives/2137
