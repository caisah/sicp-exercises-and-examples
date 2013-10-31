;; Alyssa's program is incomplete because she has not specified the implementation of
;; the interval abstraction. Here is a definition of the interval constructor:
;;   (define (make-interval a b) (cons a b))
;; Define selectors upper-bound and lower-bound to complete the implementation.

(define (make-interval a b)
  (cons a b))
(define (lower-bound i)
  (car i))
(define (upper-bound i)
  (cdr i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define i1
  (make-interval 2 3))
(define i2
  (make-interval 4 6))
(lower-bound i1)
(upper-bound i2)
(define i+
  (add-interval i1 i2))
(lower-bound i+)
(define i*
  (mul-interval i1 i2))
(upper-bound i*)
