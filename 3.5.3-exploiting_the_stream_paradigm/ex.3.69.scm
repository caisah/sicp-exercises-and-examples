;; Write a procedure triples that takes three infinite streams s, t, and u, and produces
;; the stream of triples (si, tj, uk) such that i <= j <= k. Use triples to generate
;; the stream of all Pythagorean triples of positive integers, ie, the triples (i, j, k)
;; such that i <= j, and i^2 + j^2 = k^2.

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

(define (triples s t u)
  (cons-stream (list 
                (stream-car s)
                (stream-car t) 
                (stream-car u))
               (interleave
                (stream-map (lambda (x) (cons (stream-car s) x))
                            (stream-cdr (pairs t u)))
                (triples (stream-cdr s)
                         (stream-cdr t)
                         (stream-cdr u)))))

(define (phythagorean-numbers)
  (define (square x) (* x x))
  (define numbers (triples integers integers integers))
  (stream-filter (lambda (x) 
                   (= (square (caddr x)) 
                      (+ (square (car x)) (square (cadr x)))))
                 numbers))
