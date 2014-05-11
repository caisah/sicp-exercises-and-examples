(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

(define (divisible? x y)
  (= (remainder x y) 0))
(define no-sevens
  (stream-filter (lambda (x) (not (divisible? x 7))) integers))
(stream-ref no-sevens 100)

(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))
(define fibs (fibgen 0 1))
(stream-ref fibs 10)


(define (sieve stream)
  (cons-stream
   (stream-car stream)
   (sieve (stream-filter
           (lambda (x)
             (not (divisible? x (stream-car stream))))
           (stream-cdr stream)))))
(define primes (sieve (integers-starting-from 2)))
(stream-ref primes 50)



(define ones (cons-stream 1 ones))
(define twos (cons-stream 2 twos))
(define (add-streams s1 s2) (stream-map + s1 s2))
(add-streams ones twos)
(define integers
  (cons-stream 1 (add-streams ones integers)))
(define fibs
  (cons-stream 0 (cons-stream 1 (add-streams
                                 (stream-cdr fibs)
                                 fibs))))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (+ x factor)) stream))
(define double
  (cons-stream 1 (scale-stream double 2)))

(define primes
  (cons-stream
   2
   (stream-filter prime? (integers-starting-from 3))))
(define (prime? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) true)
          ((divisible? n (stream-car ps)) false)
          (else (iter (stream-cdf ps)))))
  (iter primes))

