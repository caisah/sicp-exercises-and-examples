;; Sow that we can represent pairs of nonnegative integers using only numbers and
;; arithmetic operations if we represent the pair a and b as the integer that is the
;; product 2^a3^b. Give the corresponding definitions of the procedures cons, car, and cdr.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (div n i)
  (define (iter n res)
  (if (> (remainder n i) 0)
      res
      (iter (/ n i) (1+ res))))
  (iter n 0))

(define (car x)
  (div x 2))
(define (cdr x)
  (div x 3))

(define c (cons 3 2))
(car c)
(cdr c)
