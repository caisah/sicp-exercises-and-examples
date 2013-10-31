;; Observe that our model of evaluation allows for combinations whose operators
;; are compound expressions. Use this observation to describe the behavior of
;; the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; The operator is chosen based on the value of b:
; if b is greater than 0 than is + otherwise is -
; This resulting expression is equivalent to an addition between a
; number and another number's absolute value.
