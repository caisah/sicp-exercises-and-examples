;; The smallest-divisor procedure shown at the start of this section does lots of 
;; needless testing: After it checks to see if the number is divisible by 2 there 
;; no point in checking to see if it is divisible by any larger even numbers. This
;; suggests that the values used for test-divisor should not be 2, 3, 4, 5, 6,..., 
;; but rather 2, 3, 5, 7,... To implement this change, define a procedure next that
;; returns its input plus 2. Modify the smallest divisor procedure to use 
;; (next test-divisor) instead of (+ test-divisor 1). With timed-prime test
;; incorporating this modified version of smallest-divisor, run the test for each
;; of the 12 primes found in ex 1.22.
(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next n)
  (if (= n 2) 3
      (+ n 2)))
  

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

        
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))

(timed-prime-test 1009)
(timed-prime-test 1013) 
(timed-prime-test 1019) 
(timed-prime-test 10007) 
(timed-prime-test 10009) 
(timed-prime-test 10037) 
(timed-prime-test 100003) 
(timed-prime-test 100019) 
(timed-prime-test 100043) 
(timed-prime-test 1000003) 
(timed-prime-test 1000033) 
(timed-prime-test 1000037) 

(newline) 
(timed-prime-test 1000000007) 
(timed-prime-test 1000000009) 
(timed-prime-test 1000000021) 
(timed-prime-test 10000000019) 
(timed-prime-test 10000000033) 
(timed-prime-test 10000000061) 
(timed-prime-test 100000000003) 
(timed-prime-test 100000000019) 
(timed-prime-test 100000000057) 
(timed-prime-test 1000000000039) 
(timed-prime-test 1000000000061) 
(timed-prime-test 1000000000063) 





