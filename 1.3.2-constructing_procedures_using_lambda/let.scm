;; f(x, y) = x(1 + xy)^2 + y(1 - y) + (1 + xy)(1 - y)

;; a = 1 + xy
;; b = 1 - y
;; f(x, y) = xa^2 + yb + ab

(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
            (- 1 y)))

;  Using lambda
(define (f x y)
  ((lambda (a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

; Using let
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
  (+ (* x (square a))
     (* y b)
     (* a b))))

; Example          
(define x 5)
(+ (let ((x 3))
     (+ x (* x 10)))
   x)
; expression is 38
; and x is still 5

(define x 2)
(let ((x 3)
      (y (+ x 2)))
  (* x y))
; expression is 12
; because y is conputed using outer x
; y = 2 + 2

