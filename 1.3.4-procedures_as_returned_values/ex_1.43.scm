;; If f is a numerical function and n is a positive integer, than we can form the nth
;; repeated application of f, which is defined to be the function whose value at s is
;; f (f(...(f(x)))). For example if f is the function x -> x + 1, then the nth repeated
;; application of f is the function x -> x + n. If f is the operation of squaring a
;; number, then  the nth repeated application of f is the function that raises its
;; argument to the 2^n-th power. Write procedure that takes as inputs a procedure that
;; computes the nth repeated application of f. Your procedure should be able to
;; be used as follows:
;;   ((repeated square 2) 5)
;;   625

(define (repeated f nr)
  (define (iter x nr)
    (if (= nr 1)
        (f x)
        (f (iter x (- nr 1)))))
  (lambda (y) (iter y nr)))
((repeated square 2) 5)

