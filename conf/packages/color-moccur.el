;; (require 'color-moccur)
(when (require 'color-moccur nil t)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t))
  ;; ディレクトリ検索の時に除外するファイル
  ;; (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
;; )
;; (global-set-key (kbd "C-b") 'moccur)
(global-set-key (kbd "M-g M-f") 'moccur)
(global-set-key (kbd "M-g M-g") 'moccur-grep-find)