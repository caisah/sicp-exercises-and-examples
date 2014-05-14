;; Number that can be expressed as the sum of two cubes in more than one way are sometimes
;; called Ramanujan numbers, in honor of the mathematician Srinivasa RAmanujan.
;; Ordered streams of pairs provide an elegant solution to the problem of computing
;; these numbers. To find a number that can be written as the sum of two cubes in
;; two different ways we need only generate the stream of pairs with the same weight.
;; Write a procedure to generate the Ramanujan number. The first such number is 1729.
;; What are the next five?


(define (Ramanujan s)
  (define (stream-cadr s) (stream-car (stream-cdr s)))
  (define (stream-cddr s) (stream-cdr (stream-cdr s)))
  (let ((scar (stream-car s))
        (scadr (stream-cadr s)))
    (if (= (sum-triple scar) (sum-triple scadr)) 
        (cons-stream (list (sum-triple scar) scar scadr)
                     (Ramanujan (stream-cddr s)))
        (Ramanujan (stream-cdr s)))))
(define (triple x) (* x x x))
(define (sum-triple x) (+ (triple (car x)) (triple (cadr x))))
(define Ramanujan-numbers
  (Ramanujan (weighted-pairs integers integers sum-triple)))

the next five numbers are:
(4104 (2 16) (9 15))
(13832 (2 24) (18 20))
(20683 (10 27) (19 24))
(32832 (4 32) (18 30))
(39312 (2 34) (15 33))
