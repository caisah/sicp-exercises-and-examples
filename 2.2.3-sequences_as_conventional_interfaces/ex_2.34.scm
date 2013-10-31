;; Evaluating plynomial in x at a given value of x can be formulated as an accumulation.
;; We evaluate the polynomial
;;    an x^n + an-1 x^n-1 + ... + a1 x + a0
;; using a well known algorithm called Horner's rule, which structures the computations as
;;   (...(an x + an-1)x + ...+ a1)x + a0
;; In other words, we start with a an, multiply by x, add an-1, multiply by x, and so on,
;; until we reach a0.
;; Fill in the following template to produce a procedure that evaluates a polynomial using
;; Horner's rule. Assume that the coefficients of the polynomial are arranged in a
;; sequence, from a0 through an.

;; (define (horner-eval x coefficient-sequence)
;;   (accumulate (lambda (this-coeff higher-terms)  <??>)
;;               0
;;               coiefficient-sequence))

;; For example,to compute 1 + 3x + 5x^3 + x^5 at x=2 you would evaluate
;;   (horner-eval 2 (list 1 3 0 5 0 1))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)(+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))
