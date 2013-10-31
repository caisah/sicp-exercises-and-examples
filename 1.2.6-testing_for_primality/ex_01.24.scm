;; Modify the timed-prime-test procedure of Ex.1.22 to use fast-prime? (the Fermat method)
;; and test each of the 12 primes you fond in that exercise. Since the Fermat test has
;; O(log n) growth, how would you expect the time to test primes near 1,000,000 to
;; compare with the time needed to test primes near 1000? Do your data bear this out?

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
        
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 4)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))


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

(search-for-primes 1000000 1001000)
