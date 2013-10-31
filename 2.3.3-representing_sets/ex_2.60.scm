;; We specified that a set would be represented as a list with no duplicates. Now suppose
;; we allow duplicates. For instance, the set {1,2,3} could be represented as the list
;; (2 3 2 1 3 2 2). Desighn procedures element-of-set?, adjoin-set, union-set, and
;; intersection-set that operate on this representation. How does the efficiency of each
;; compare with the corresponding procedure for the non-duplicate representation? Are
;; there applications for which you would use this representation inf preference to the
;; non-duplicate one?

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else
         (intersection-set (cdr set1) set2))))

(define set1 (list 2 3 2 1 3 2 2))
(define set2 (list 3 3 4 3 1))

(element-of-set? 1 set1)
(element-of-set? 6 set2)

(adjoin-set 8 set1)

(union-set set1 set2)

(intersection-set set1 set2)
