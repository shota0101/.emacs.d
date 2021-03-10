
;; コードを折りたたむ

(load-library "hideshow")

(define-key hs-minor-mode-map (kbd "C-c C-v") 'hs-toggle-hiding)
(define-key hs-minor-mode-map (kbd "C-c C-V") 'hs-hide-level)
;; (define-key hs-minor-mode-map (kbd "C-c C-v") 'hs-show-all)
