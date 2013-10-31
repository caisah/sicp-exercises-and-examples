;; Sum of integers a...b

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))
(sum-integers 1 10)

;; Sum of cubes of integers

(define (cube n)
  (* n n n))
(define (sum-of-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-of-cubes (+ a 1) b))))
(sum-of-cubes 1 3)

;; Sum of 1/1*3 + 1/5*7 + 1/9*11 + ...

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))
(pi-sum 1 20)


;; Generalization

(define (inc n)
  (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-cubes a b)
  (sum cube a inc  b))
(sum-cubes 1 10)

(define (identity n)
  n)
(define (sum-of-integers a b)
  (sum identity a inc b))
(sum-of-integers 1 10)

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))
(pi-sum 1 100)
