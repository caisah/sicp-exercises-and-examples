;; Define a procedure cubic that can be used together with the newtons-method procedure
;; in expressions of the form:
;;   (newton-method (cubic a b c) 1)
;; to approximate zeros of the cubic x^3 + ax^2 + bx + c

(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
 (lambda (y)
   (+ (cube y)
      (* a (cube y))
      (* b (square y))
      c)))

(newton-method (cubic 1 2 3) 1)
