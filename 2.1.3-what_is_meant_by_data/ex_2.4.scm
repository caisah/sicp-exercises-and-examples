;; Here is an alternative procedural representation of pairs. For this representation,
;; verify that (car (cons x y)) yields x for any objects x and y.
;;   (define (cons x y)
;;     (lambda(m) (m x y)))

;;   (define (car z)
;;     (z (lambda (p q) p)))
;; What is the corresponding definition of cdr?

(define (cons a b)
  (lambda(y) (y a b)))
(define (car z)
  (z (lambda(p q) p)))
(define (cdr z)
  (z (lambda(p q) q)))
(define t (cons 1 2))
(car t)
(cdr t)

