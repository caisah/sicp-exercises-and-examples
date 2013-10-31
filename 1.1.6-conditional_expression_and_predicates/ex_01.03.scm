;; Define a procedure that takes three numbers as arguments and returns the sum
;; of the squares of the two larger numbers.

(define (sum-of-the-two-largest a b c)
  (cond ((and (>= a b) (>= b c)) (+ a b))
        ((and (>= a b) (>= c b)) (+ a c))
        ((and (>= b a) (>= c a)) (+ b c))))
