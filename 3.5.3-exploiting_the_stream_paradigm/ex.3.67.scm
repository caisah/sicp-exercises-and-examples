;; Modify the pairs procedure so that (pairs integers integers) will produce the stream
;; of all pairs of integers (i, j) (without the condition i<=j). Hint: You will need to
;; mix in an additional stream.

(define integers
  (cons-stream 0 (stream-map 1+ integers)))

(define (all-pairs s t)
  (cons-stream 
   (list (stream-car s) (stream-car t))
   (interleave
    (interleave
     (stream-map (lambda (x) (list (stream-car s) x))
                 (stream-cdr t))
     (all-pairs (stream-cdr s) (stream-cdr t)))
    (stream-map (lambda (x) (list x (stream-car t)))
                (stream-cdr s)))))

(define a (all-pairs integers integers))
(stream-ref a 2)
(stream-ref a 3)
(stream-ref a 4)
(stream-ref a 5)

