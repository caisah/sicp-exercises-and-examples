;; The sum procedure above generates a linear recursion. The prodedure can be rewritten
;; so that the sum is performed iteratively. Show how to do this by filling in the missing
;; expressions in the following definition:
;;
;;  (define (sum term a next b)
;;    (define (iter a result)
;;      (if <??>
;;          <??>
;;          (iter <??> <??>)))
;;    (iter <??> <??>))
;;
;;
;;  Previous sum
;;  -------------
;;
;; (define (sum term a next b)
;;  (if (> a b)
;;      0
;;      (+ (term a)
;;      (sum term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))


;; For testing

(define (inc n)
  (+ n 1))

(define (identity n) n)

(define (sum-of-integers a b)
  (sum identity a inc b))
(sum-of-integers 1 3)
