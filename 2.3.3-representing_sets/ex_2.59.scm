;; Implement the union-set operation for the unordered list representation of sets.

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((not (element-of-set? (car set2) set1))
         (cons (car set2) (union-set set1 (cdr set2))))
        (else
         (union-set set1 (cdr set2)))))

(define set1 (list 1 3 5 7))
(define set2 (list 3 4 5 6 7))

(union-set set1 set2)

