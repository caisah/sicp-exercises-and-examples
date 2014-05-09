(stream-car (stream-cdr
             (stream-filter
              prime? (stream-enumerate-interval
                      10000 100000))))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
  ((cond ((stream-null? stream) the-empty-stream)
         ((pred (stream-car stream))
          (cons-stream (stream-car stream)
                       (stream-filter pred
                                      (stream-cdr stream))))
         (else (stream-filter pred (stream-cdr stream))))))



