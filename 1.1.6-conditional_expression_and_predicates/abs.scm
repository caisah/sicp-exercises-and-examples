(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) x)
        ((< x 0) (- x))))
(abs -3)


(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))
(abs -1)

(define (abs x)
  (if (< x 0)
      (- x)
      x))
(abs 3)
