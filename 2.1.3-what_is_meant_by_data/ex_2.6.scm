;; In case representing pairs as procedures wasn't mindboggling enough, consider that in
;; a language that can manipulate procedures, we can get by without numbers (at least
;; insofar as nonnegative integers are concerned) by implementing 0 and the operation of
;; adding 1 as
;;  (define zero (lambda (f) (lambda (x) x)))

;;  (define (add-1 n)
;;     (lambda (f) (lambda (x) (f ((n f) x)))))

;; This representation is known as Church numerals, after its inventor, Alonzo Church,
;; the logician who invented the lambda calculus.
;; Define one and two directly (not in terms of zero and add-1). (Hint: Use substitution
;; to evaluate (add-q zero)). Give a direct definition of the addition procedure +
;; (not in terms of repeated application of add-1).

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define one+
  (one 1+))
(one+ 3)
(1+ 3)

(define two+
  (two 1+))
(two+ 10)
(define (two++ y)
  (1+ (1+ y)))
(two++ 10)


