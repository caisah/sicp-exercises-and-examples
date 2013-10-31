;; An infinite continued fraction is an expression of the form
;; f = N1 / (D1 + N2 / (D2 + N3 / (D3 +...)))
;; As an example one can show that the infinite continued fraction expansion with the
;; Ni and the Di all equal to 1 produces 1/fi where fi is the golden ratio. One way to
;; approximate an infinite continued fraction is to truncate the expansion after a given
;; number of terms. Such a truncation - a so called k-term finite continued fraction -
;; has the form
;;  N1/ (D1 + (N2 / ... + Nk/Dk))
;; Suppose that n and d are procedures of one argument (the term index i) that return the
;; Ni and Di of the terms of the continued fraction. Define a procedure cont-frac
;; such tat evaluating (cont-frac n d k) computes the value of the k-term finite
;; continued fraction. Check your procedure by approximating 1/fi using
;;  (cont-frac (lambda (i) 1.0)
;;             (lambda (i) 1.0))
;;             k)
;; If your cont-frac procedure generates a recursive process, write one that generates
;; a recursive process.

(define (cont-frac n d k)
  (define (func j)
  (if (> j k)
      0
      (/ (n j) (+ (d k) (func (+ j 1))))))
  (func 1))

(define (cont-frac n d k) 
  (define (func j result) 
    (if (= j 0) 
        result 
        (func (- j 1)  
              (/ (n j) (+ (d j) result)))))
  (func k 0.0))

(cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 10)
