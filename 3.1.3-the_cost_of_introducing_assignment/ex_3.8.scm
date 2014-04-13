;; When we defined the evaluation model in Section 1.1.3, we said that the first step
;; in evaluating an expression is to evaluate its sub-expressions. But we never specified
;; the order in which the sub-expressions should be evaluated (e.g. left to right or right
;; to left). when we introduce a assignment, the order in which the arguments to procedure
;; are evaluated can make a difference to the result. Define a simple procedure f such that
;; evaluating (+ (f 0) (f 1)) will return 0 if the arguments to + are evaluated from left
;; to right but will return 1 if the arguments are evaluated from right to left.

(define n 1)
(define (f x)
  (set! n (* n x))
  n)
(+ (f 0) (f 1))

(define n 1)
(define (f x)
  (set! n (* n x))
  n)
(+ (f 1) (f 0))
