;; Abstract your answer to Exercise 2.30 to produce a procedure tree-map with the property
;; that square-tree could be defined as
;; (define (square-tree tree) (tree0map square tree))

(define (tree-map f tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map subtree)
             (f subtree)))
       tree))
(define (square-tree tree) (tree-map square tree))

