;; We saw that attempting to compute square roots by naively finding a fixed point
;; of y -> x/y does not converge, and that can be fixed by average damping. The same
;; method works for finding cube roots as fixed points of the average damped y -> x/y^2.
;; Unfortunately, the process does not work for fourth roots-a single average damp is
;; not enough to make a fixed point search for y-> x/y^3 converge. On the other hand,
;; if we average damp twice (i.e. use the average damp of the average damp of y-> x/y^3)
;; the fixed-point search does converge. Do some experiments to determine how many average
;; damps are required to compute nth roots as fixed-point search based upon repeated
;; average damping of y-> x/y^(n-1). Use this to implement a simple procedure for
;; computing nth roots using fixed-point, average-damp, and the repeated procedure
;; of ex 1.43. Assume that any arithmetic operations you need are available as primitives.

(define (repeated f nr)
  (define (iter x nr)
    (if (= nr 1)
        (f x)
        (f (iter x (- nr 1)))))
  (lambda (y) (iter y nr)))

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

;;-----------------------------------

(define (get-max-pow n) 
  (define (iter p r) 
    (if (< (- n r) 0) 
        (- p 1) 
        (iter (+ p 1) (* r   
  (iter 1 2)) 

(define (pow b p) 
  (define (even? x) 
    (= (remainder x 2) 0))
  
  (define (sqr x) 
    (* x x)) 
  
  (define (iter res a n) 
    (if (= n 0) 
        res 
        (if (even? n) 
            (iter res (sqr a) (/ n 2)) 
            (iter (* res a) a (- n 
  (iter 1 b p))

(define (nth-root n x) 
  (fixed-point ((repeated average-damp (get-max-pow n)) 
                (lambda (y) (/ x (pow y (- n 1))))) 
               1.0))

(nth-root 4 256)

