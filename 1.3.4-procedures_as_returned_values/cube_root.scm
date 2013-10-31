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

(define (average-damp f)
 (lambda (x) (average x (f x))))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))

(cube-root 27)


