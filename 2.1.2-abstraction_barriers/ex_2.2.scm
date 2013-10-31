;; Consider the problem of representing line segments in a plane. Each segment is
;; represented as a pair of points: a starting point and an ending point. Define a
;; constructor make-segment and selectors start-segment and end-segment that define
;; the representation of segments in terms of points. Furthermore, a point can be
;; represented as a pair of numbers: the x coordinate and the y coordinate. Accordingly,
;; specify a constructor make-point and selectors x-point and y-point that define this
;; representation. Finally, using your selectors and constructors, define a procedure
;; midpoint-segment that takes a line segment as argument and returns its midpoint
;; (the point whose coordinates are the average of the coordinates of the endpoints).
;; To try your procedures, you'll need a way to print points:
;;    (define (print-point p)
;;      (newline)
;;      (display "(")
;;      (display (x-point p))
;;      (display ",")
;;      (display (y-point p))
;;      (display "("))

(define (new-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))
(define (make-segment p1 p2)
  (cons p1 p2))
(define (midpoint-segment s)
 (new-point (/ (+ (car (car s)) (car (cdr s))) 2)
            (/ (+ (cdr (car s)) (cdr (cdr s))) 2)))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define fpoint (new-point 1 1))
(define spoint (new-point 3 3))
(define seg (make-segment fpoint spoint))
(define mid (midpoint-segment seg))
(print-point mid)

