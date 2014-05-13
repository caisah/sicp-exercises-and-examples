;; Use the series
;;  ln2 = 1 - 1/2 + 1/3 - 1/4 +...
;; to compute three sequences of approximations to the natural logarithm of 2, in the
;; same way we did above for Π. How rapidly do these sequences converge?

(define (ln2-summands n)
        (cons-stream (/ 1.0 n) 
                     (stream-map - (ln2-summands (+ n 1)))))
(define ln2-stream
        (partial-sums (ln2-summands 1)))
