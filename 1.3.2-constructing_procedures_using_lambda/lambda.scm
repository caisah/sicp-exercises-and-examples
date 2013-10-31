(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; pi-sum using lambda
(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

; integral procedure using lambda
(define (integral f a b dx)
  (* (sum f (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
     dx))

; lambda used a the operator
((lambda (a b c) (+ a b c)) 1 2 3)
