;; In 1737, the Swiss mathematician Leonhard Euler published a memoir De Fractibus
;; Continuis, which included a continued fraction expansion for e - 2, where e is the
;; base of the natural logarithms. In this fraction, the Ni are all 1 and the Di are
;; successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8,.... Write a program that uses your
;; count-frac procedure from Ex 1.37 to approximate e, based on Euler's expansion.

(define (cont-frac n d k) 
  (define (func j result) 
    (if (= j 0) 
        result 
        (func (- j 1)  
              (/ (n j) (+ (d j) result)))))
  (func k 0.0))
(define (div3? x)
  (= (remainder x 3) 0))
(define (eterms n)
  (if (div3? (+ n 1))
      (* (/ (+ n 1) 3) 2)
      1))
(cont-frac (lambda (x) 1.0) eterms 10)


