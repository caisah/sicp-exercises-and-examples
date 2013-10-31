;; Use the results of Ex 2.63 and Ex 2.64 to give O(n) implementations of union-set
;; and intersection-set for sets implemented as (balanced) binary tree.

(define (union-set tree1 tree2) 
   (list->tree (union-set-list (tree->list tree1) 
                          (tree->list tree2))))
  
 (define (intersection-set tree1 tree2)
   (list->tree (intersection-set-list (tree->list tree1) 
                                 (tree->list tree2))))
