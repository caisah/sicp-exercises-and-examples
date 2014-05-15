;; Exercise 3.6 discussed generalizing the random-number generator to allow one or reset
;; the random-number sequence so as to produce repeatable sequences of "random" numbers.
;; Produce a stream formulation of this same generator that operates on an input stream
;; of requests to generate the new random number or to reset the sequence to a specified
;; value and that produces the desired stream of random numbers. Don't use assignment
;; in your solution.

(define (rand-update x)
  (let ((a (expt 2 32))
        (c 1103515245)
        (m 12345))
    (modulo (+ (* a x) c) m)))

(define random-init 137)

(define (random-numbers s-in)
  (define (action x m)
    (cond ((eq? m 'generate)
           (rand-update x))
          (else m)))
  (cons-stream 
   random-init
   (stream-map action (random-numbers s-in) s-in)))
