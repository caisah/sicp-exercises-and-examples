;; Define a better version of make-rat that handles both positive and negative arguments.
;; Make-rat should normalize the sign so that if the rational number is positive, both
;; the numerator and  denominator are positive, and if the rational number is negative,
;; only the numerator is negative.

(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (* (/ (abs n) n) (/ (abs d) d))))
    (cons (* sign (/ (abs n) g)) (/ (abs d) g))))
(define  r (make-rat -3 4))
(print-rat r)

