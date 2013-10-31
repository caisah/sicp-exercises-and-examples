(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
(factorial 3)


(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
(define (factorial n)
  (fact-iter 1 1 n))
(factorial 4)
