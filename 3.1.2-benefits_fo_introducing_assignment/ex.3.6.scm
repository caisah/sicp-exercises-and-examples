;; It is useful to be able to reset a random-number generate or to produce a sequence
;; starting from from a given value. Design a new rand procedure that is called with an
;; argument that is either the symbol generate or the symbol reset and behaves as follows:
;; (rand 'generate) produces a new random number; ((rand 'reset) <new-value>) resets
;; the internal state variable to the designated <new-value>. Thus, by resetting the
;; state, one can generate repeatable sequences. These are very handy to have when testing
;; and debugging programs that use random numbers.

(define (rand-update x)
      (modulo (+ (* x 1103515245) 12345) 32768))

(define random-init (get-universal-time))

(define rand
  (let ((n random-init))
    (lambda (s)
      (cond ((eq? s 'generate)
             (begin (set! n (rand-update n)) n))
            ((eq? s 'reset)
             (lambda (x) (set! n x) x))
            (else
             (error "Unknown symbol - RAND" s))))))

(rand 'generate)
((rand 'reset) 1)
