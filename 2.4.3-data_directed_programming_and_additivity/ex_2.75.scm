;; Implement the constructor make-from-mag-ang if message passing style. This procedure
;; should be analogous to the make-from-real-imag procedure give before.

(define (make-from-mag-ang x y)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) x)
          ((eq? op 'angle) y)
          ((eq? op 'real-part)
           (* x (cos y)))
          (eq? op 'imag-part)
          (* x (sin y))
          (else
           (error "Unknown op - MAKE-FROM-REAL-IMAG" op))))
  dispatch)
