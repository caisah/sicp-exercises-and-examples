;; The good-enough? test used in computing square roots will not be very effective for
;; finding the square roots of very small numbers. Also, in real computers, arithmetic 
;; operations are alomost always performed with limited precision. This makes our test
;; inadequate for very large numbers. Explain these statements, with examples showing
;; how the test fails for small and large nubmers. An alternative strategy for implementing
;; good-enough? is to watch how guess changes from one iteration to the next and to stop
;; when the change is a very small fraction of the guess. Design a square-root procedure
;; that uses this kind of end test. Does this work better for small and large numbers?


; The first version of the square using the initial  good-enough? example
(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

;; TESTS ;:
(sqrt 9)                 ;  3.00009155413138
(sqrt 1000000002345)     ;  1000000.0011725
(sqrt 0.00000003423)     ;  0.03125036476258847



; My version of good-enogh?
(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x) 
  (< (abs (/ (- (improve guess x) guess) 
	     guess)) 
     0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

;; TESTS ;;
(sqrt 9)                 ;  3.00009155413138
(sqrt 1000000002345)     ;  1000454.9919816428
(sqrt 0.00000003423)     ;  0.00018501551931756775
