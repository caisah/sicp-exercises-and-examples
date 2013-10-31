(map square (list 1 2 3 4 5))
;; (1 4 9 16 25)

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(filter odd? (list 1 2 3 4 5))
;; (1 3 5)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))
;; 15

(accumulate * 1 (list 1 2 3 4 5))
;; 120



(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 2 7)
;;  (2 3 4 5 6 7)



(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(enumerate-tree (list 1 (list 2 (list 3 4)) 5))
;;  (1 2 3 4 5)



(define (sum-odd-squares tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                           (enumerate-tree tree)))))

(define (fib n)
  (if (<= n 2)
      1
      (+ (fib (- n 1)) (fib (- n 2)))))

(define (even-fibs n)
  (accumulate cons
              '()
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))
(even-fibs 20)



(define (list-fib-squares n)
  (accumulate cons
              '()
              (map square
                   (map fib
                        (enumerate-interval 0 n)))))
(list-fib-squares 10)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
              1
              (map square
                   (filter odd? sequence))))
(product-of-squares-of-odd-elements (list 1 2 3 4 5))
;;  225
