;; A continued fraction representation of the tangent function was published in 1770
;; by the German mathematician J.H Lambert:
;; tan x = x / (1 - x^2 / (3 - x^2 / (5 -...)))
;; where x is in radians. Define a procedure (tan-cf x k) that computes an approximation
;; to the tangent function based on Lambert's formula. K specifies the number of terms to
;; compute, as in Ex. 1.37.

(define (tan-cf x k)
  (define (sq n)
    (* x x -1))
  (define (odd n)
    (- (* n 2) 1))
(define (cont-frac n d k) 
  (define (func j result) 
    (if (= j 0) 
        result 
        (func (- j 1)  
              (/ (n j) (+ (d j) result)))))
  (func k 0.0))
  (/ (cont-frac sq odd k) x))

