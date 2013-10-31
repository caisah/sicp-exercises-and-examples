;; The width of an interval is half of the difference between its upper and lower bounds.
;; The width is a measure of the uncertainty of the number specified by the interval.
;; For some arithmetic operations the width of the result of combining two intervals is
;; a function only of the widths of the arguments of the intervals, whereas for others
;; the width of the combination is not a function of the widths of the argument intervals.
;; Show that the width of the sum (or difference) of two intervals, is a function only of
;; widths of the intervals being added (or substracted). Give examples to show that this
;; is not true for multiplication or division.


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

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (display-interval i) 
  (newline) 
  (display "[") 
  (display (lower-bound i)) 
  (display ",") 
  (display (upper-bound i)) 
  (display "]")) 

(define (wid-interval i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))

(define i1
  (make-interval 2 4))
(define i2
  (make-interval 6 10))
(display-interval (add-interval i1 i2))

(wid-interval (add-interval i1 i2))       ; 3
(+ (wid-interval i1) (wid-interval i2))   ; 3

