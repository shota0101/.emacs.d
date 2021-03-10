
;; i-search
(define-key isearch-mode-map [return] 'isearch-repeat-forward)
(define-key isearch-mode-map [S-return] 'isearch-repeat-backward)
(define-key isearch-mode-map "\C-v" 'isearch-yank-pop)
(define-key isearch-mode-map "\C-f" 'isearch-exit)
(define-key isearch-mode-map "\C-g" 'isearch-exit)
(define-key isearch-mode-map "\d" 'isearch-del-char)
;;(define-key isearch-mode-map "\C-v" 'isearch-yank-char)
;;(define-key isearch-mode-map "\C-v" 'isearch-yank-word-or-char)
