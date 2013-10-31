;; Define a procedure square-tree analogous to the square-list procedure of Exercise 2.21.
;; That is, square-tree should behave as follows:
;;  (square-tree
;;    (list 1
;;          (list 2 (list 3 4) 5)
;;          (list 6 7)))
;; Define square-tree both directly (i.e. without using any higher order procedures) and
;; also by using map and recursion.

(define li
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(define test
  (list 1 2))

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree subtree)
             (square subtree)))
       tree))
