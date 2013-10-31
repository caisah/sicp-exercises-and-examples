;; Implement a representation for rectangles in a plane. (Hint: You may want to make
;; use of Ex. 2.2.) In terms of your constructors and selectors, create procedures that
;; compute the perimeter and the area of a given rectangle. Now implement a different
;; representation for rectangles. Can you design your system with suitable abstraction
;; barriers, so that the same perimeter and area procedures will work using either
;; representation?

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
(define (len-segment s)
  (sqrt ( + (square (- (car (car s)) (car (cdr s))))
            (square (- (cdr (car s)) (cdr (cdr s)))))))

(define (new-rect p1 p2 p3)
  (let ((s1 (make-segment p1 p2))
        (s2 (make-segment p2 p3)))
    (cons s1 s2)))
(define (rect-perim r)
  (* 2 (+ (len-segment (car r))
          (len-segment (cdr r)))))
(define (rect-area r)
  (* (len-segment (car r))
     (len-segment (cdr r))))

(define (rect2 s1 s2)
  (cons s1 s2))

(define p1 (new-point 3 1))
(define p2 (new-point 6 1))
(define p3 (new-point 6 3))
(define r (new-rect p1 p2 p3))
(rect-perim r)
(rect-area r)


