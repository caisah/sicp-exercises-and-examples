(define x (list '(a b) 'c 'd))
(define y (list 'e 'f))

(set-car! x y) ;; used only for side effects
(define z (cons y (cdr x)))

;; (define (cons x y)
;;   (let ((new (get-new-pair)))
;;     (set-car! new x)
;;     (set-cdr! new y)))

