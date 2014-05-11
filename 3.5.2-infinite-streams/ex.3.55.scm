;; Define a procedure partial-sums that takes as arguments a stream S and returns
;; the stream whose elements are S0, S0+S1, S0+S1+S2.... For examples (partial-sums
;; integers) should return the stream 1, 3, 6, 10, 15,...


(define (partial-sums stream)
  (define (add-elements stream sum)
    (cons-stream sum
                 (add-elements (stream-cdr stream)
                               (+ sum (stream-car stream)))))
  (add-elements stream 0))


