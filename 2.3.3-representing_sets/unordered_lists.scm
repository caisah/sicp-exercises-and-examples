(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else
         (intersection-set (cdr set1) set2))))

(define set1 (list 1 3 5 7))
(define set2 (list 3 4 5 6 7))

(element-of-set? 1 set1)
(element-of-set? 1 set2)

(adjoin-set 8 set1)

(intersection-set set1 set2)
