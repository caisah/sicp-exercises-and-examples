;; Using primitive multiplier, adder, and constant constraints, define a procedure
;; average that takes three connectors a, b, and c as inputs and establishes the
;; constraint that the value of c is the average of the values of a and b.

(define (average a b c)
  (let ((u (make-connector))
        (v (make-connector)))
    (adder a b u)
    (multiplier c v u)
    (constant 2 v)
    'ok))
