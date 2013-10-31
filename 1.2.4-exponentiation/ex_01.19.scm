;; There is a clever algorithm for computing the Fibonacci numbers in a logarithmic
;; number of stps. Reacall the tranformation of the state variables a and b in the
;; fib-iter process: a <- a + b and b <- a. Call this transformation T, and observe that
;; applying T over and over again n times, starting with 1 and 0, produces  the pair
;; Fib(n+1) and Fib(n). IN other words, the Fibonacci numbers are produced by applying
;; T^n, the nth power of the tranformation T, starting with the pair (1, 0). NOw consider
;; T to be the special case fo p = 0 and q = 1 in a family of transformations T pq, where
;; T pq transforms the pair (a, b) according to a <- bq + aq + ap and b <- bp + aq. Show
;; that if we apply such a transformation T pq twice, the effect is the same as using a
;; single transfromation T p`q` of the same form, and compute p` and q` in terms of p and
;; q.This gives us an an explicit wat to square these transformations, and thus we can
;; compute T^n using successive squaring, as in the fast-expt procedure. Put this all
;; together to complete the follosing procedure, which runs in a logarithmic number of
;; steps.

(define (fib n)
  (fib-iter(1 0 0 1 n)))

(define (even? x)
  (remainder x 2))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (b p) (* a q))
                        p
                        q
                        (- count 1)))))
(define (square x) (* x x))

(fib 1)
(fib 2)
(fib 3)
(fib 4)

  
