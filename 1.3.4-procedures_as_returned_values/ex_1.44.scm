;; The idea of smoothing a function is an important concept in signal processing. If f is
;; If f is a function and dx is some small number, then the smoothed version of f is the
;; function whose value at a point x is the average of f(x - dx), f(x), and f(x + dx).
;; Write a procedure smooth that takes as input a procedure that computes f and returns
;; a procedure that computes the smoothed f. It is sometimes valuable to repeatedly
;; smooth a function (that is, smooth the smoothed function, and so on) to obtain the
;; n-fold smoothed function. Show how to generate the n-fold smoothed function of any
;; give function using smooth and repeated from ex. 1.43.

(define (repeated f nr)
  (define (iter x nr)
    (if (= nr 1)
        (f x)
        (f (iter x (- nr 1)))))
  (lambda (y) (iter y nr)))


(define dx 0.00001)
(define (smooth f)
  (lambda (y)
    (/ (+ (f (- y dx))
          (f y)
          (f (+ y dx)))
       3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth square 10) 2)
