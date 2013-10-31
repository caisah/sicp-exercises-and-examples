;; Simpson's Rule is a more accurate method of numerical integration than the method
;; illustrated above. Using Simpson's Rule, the integral of a function f between a and b
;; is approximated as:
;; h/3(y0 + 4y1 + 2y2 + 4y3 + 2y4 +...+ 2yn-2 + 4yn-1 + yn)
;; where h = (b-a)/n, for some even integer n, and yk = f(a + kh).
;; (Increasing n increases the accuracy of the approximation.) Define a procedure that takes
;; as arguments f, a, b and n and returns the value fo the integral, computed using
;; Simpson's Rule. Use your procedure to integrate cube between 0 and 1 (with n=100 and
;; n = 1000).

(define (cube x)
  (* x x x))

(define (simpson f a b n)

(define (even? x)
  (= (remainder x 2) 0))
  
(define (pre n)
  (if (even? n)
      n
      (+ 1 n)))

(define m
  (pre n))

(define h
  (/ (- b a) m))

(define (y k)
  (f (+ a (* k h))))

(define (iter n)
  (cond  ((< n 1) 0)
         ((= n 1) (y 1))
         (else
          (+ (* 4.0 (y (- n 1)))
             (* 2.0 (y (- n 2)))
             (iter (- n 2))))))

(* (/ h 3) (+ (y 0) (iter m) (y m))))

(simpson cube 0 1 1000)
