;; Give an implementation of adjoin-set using the ordered representation. By analogy with
;; element-of-set? show how to take advantage of the ordering to produce a procedure that
;; requires on the average about half as many steps as with the unordered representation.

(define (adjoin-set x set)
  (cond ((null? set) (append set (list x)))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(adjoin-set 4 (list 2 3 5 6 8))
