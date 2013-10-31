;; Newton's method for cube roots is based on the fact that if y is an approximation to
;; the cube root of x, then a better approximation is given by the value
;;             x / y ^ 2 + 2 y
;;             --------------
;;                   3
;; Use this formula to implement a cube-root procedure analogous to teh square root
;; procedure.

(define (cube x)
  (* x x x))

(define (improve guess x)
 (/ (+ (/ x (* guess guess))
       (* 2 guess))
    3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x))
     0.001))

(define (root-iter guess x)
  (if (good-enough? guess x)
      guess
      (root-iter (improve guess x)
		 x)))
(define (cbrt x)
  (root-iter 1.0 x))

;; TESTS ;:
(cbrt 8)                 ;  2.000000000012062
