;; Most Lisp implementations include a primitive called runtime that returns an integer
;; that specifies the amount of time the system has been running (measured, for example
;; in microseconds). The following timed-prime-test procedure, when called with an integer
;; n, prints n and checks to see if n is prime. If n is prime, the procedure prints three
;; asterisks followed by the amount of time used in performing the test.
;; Using this procedure, wrote a procedure search-for-primes that checks the primality
;; of consecutive odd integers in a specified range. Use your procedure to find the three
;; smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger
;; than 1,000,000. Note the time needed to test each prime.
(define (square x) (* x x)) 

(define (smallest-divisor n) 
  (find-divisor n 2)) 

(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (+ test-divisor 1))))) 

(define (divides? a b) 
  (= (remainder b a) 0))

(define (prime? n) 
  (= n (smallest-divisor n)))

(define (timed-prime-test n) 
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time) 
  (if (prime? n) 
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time) 
  (newline) 
  (display n) 
  (display " *** ") 
  (display elapsed-time))

;; Search for primes procedure

(define (search-for-primes start end)
  (define (print-primes start end)
    (timed-prime-test start)
    (if (<= start (- end 1))
        (print-primes (+ start 2) end)))
  (define (go)
    (if (even? start)
        (print-primes (+ start 1) end)
        (print-primes start end)))
  (go))


(search-for-primes 100000000000 100000000057)
