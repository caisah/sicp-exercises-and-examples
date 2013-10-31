;; Ben Bitdiddle, an expert systems programmer, looks over Alyssa's shoulder and
;; comments that it is not clear what it means to divide by an interval that spans
;; zero. Modify Alyssa's code to check for this condition and to signal an error
;; if it occurs.

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
  (if (< (* (lower-bound y) (upper-bound y)) 0)
      (error "Division error" y)
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

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

(define szero
  (make-interval -1.0 1.0))


