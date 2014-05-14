;; It would be nice to be able to generate streams in which the pairs appear in some
;; useful order, rather that in order that results form an ad-hoc interleaving process.
;; We can use a technique similar to the merge procedure of Ex. 3.56, if we define
;; a way to say that tone pair of integers is "less than" another. One way to do this
;; is to define a "weighting function" W(i, j) and stipulate that (i1, j1) is less
;; than  (i2, j2) if W(i1, j1) < W(i2, j2). Write a procedure merge weighted that is
;; like merge, except that merge-weighted takes an additional argument weight, which
;; is a procedure that computes the weight of a pair, and is used to determine the
;; order in which elements should appear in the result-ing merged stream. Using this,
;; generalize pairs to a procedure weighted-pairs that takes two streams together with a
;; procedure that computes a weighting functions, and generates the stream of pairs,
;; ordered according to weight. Use your procedure to generate
;;  a. the stream of all pairs of positive integers (i, j) with i <= j ordered
;;     according to the sum i+j,
;;  b. the stream of all pairs of positive integers (i, j) with i <= j where neither
;;     i nor j is divisible by 2, 3 or 5 and the pairs are ordered according to the sum
;;     2i + 3j + 5ij.


(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((cars1 (stream-car s1))
               (cars2 (stream-car s2)))
           (cond ((< (weight cars1) (weight cars2))
                  (cons-stream
                   cars1 
                   (merge-weighted (stream-cdr s1) s2 weight)))
                 ((= (weight cars1) (weight cars2)) 
                  (cons-stream
                   cars1 
                   (merge-weighted (stream-cdr s1) s2 weight)))
                 (else (cons-stream
                        cars2
                        (merge-weighted s1 (stream-cdr s2) weight))))))))

(define (weighted-pairs s1 s2 weight)
  (cons-stream (list (stream-car s1) (stream-car s2))
               (merge-weighted
                (stream-map (lambda (x)
                              (list (stream-car s1) x))
                            (stream-cdr s2))
                (weighted-pairs (stream-cdr s1) (stream-cdr s2) weight))))

(define (weight-a pair)
  (+ (car pair) (cadr pair)))

(define sa (weighted-pairs integers integers weight-a))

(define (weight-b pair)
  (+ (* 2 (car pair)) (* 3 (cadr pair)) 
     (* 5 (car pair) (cadr pair))))
(define (divisible? x y) (= (remainder x y) 0))
(define i-235 
  (stream-filter (lambda (x)
                   (and (not (divisible? x 2))
                        (not (divisible? x 3))
                        (not (divisible? x 5))))
                 integers))
(define sb (weighted-pairs i-235 i-235 weight-b))
