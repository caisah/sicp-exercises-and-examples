;; Write a procedure stream-limit that takes as arguments a stream and a number
;; (the tolerance). It should examine the stream until it finds two successive elements
;; that differ in absolute value by less than the tolerance, and return the second of
;; the two elements. Using this we could compute square roots up to a given tolerance
;; by

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(define (stream-limit stream tolerance)
  (let ((first (stream-car stream))
        (second (stream-car (stream-cdr stream))))
    (if (>= tolerance (- first second)) second
        (stream-limit (stream-cdr stream) tolerance))))


