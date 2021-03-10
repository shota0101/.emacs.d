
;; 最後にコピペした内容を行頭に挿入し，改行し，改行した先でも行頭に移動しておく
(fset 'insert-killring-at-head-of-line
   [home ?\C-v down home])

;; 【】を挿入
(fset 'insert-square-brackets
   [?【 ?】 ?\C-b])
(global-set-key (kbd "M-s M-9")  'insert-square-brackets)

;; ()を挿入
(fset 'insert-round-brackets
   [?  ?\( ?  ?  ?\) ?  left left left])
(global-set-key (kbd "M-s M-8")  'insert-round-brackets)

;; 行頭に「　」 ( 全角スペース ) を挿入
(fset 'add-full-width-space-to-head
   [home ?　])
(global-set-key (kbd "C-h C-p")  'add-full-width-space-to-head)

;; 「・」を挿入
(fset 'input-full-width-dot
   [?・])
(global-set-key (kbd "C-h C-d")  'input-full-width-dot)

