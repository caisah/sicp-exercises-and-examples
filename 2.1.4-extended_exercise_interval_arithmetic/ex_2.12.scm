;; Define a constructor make-center-percent that takes a center and a percentage tolerance
;; and produces the desired interval. You must also define a selector percent that
;; produces the percentage tolerance for a given interval. The center selector is the
;; same as the one shown before.

(define (make-interval a b)
  (cons a b))
(define (lower-bound i)
  (car i))
(define (upper-bound i)
  (cdr i))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0))

(define (percent i)
  (let ((c (center i))
        (dif (- (upper-bound i) (center i))))
    (/ (* dif 100.0) c)))

(define (make-center-percent c p)
  (let ((q (/ (* c p) 100)))
    (make-interval (- c q) (+ c q))))



(define test
  (make-interval 6.12 7.48))
(center test)
(percent test)
(lower-bound (make-center-percent 6.8 10))







