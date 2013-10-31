;; Suppose we evaluate the expression (list 1 (list 2 (list 3 4))). Give the result
;; printed by the interpreter, the corresponding box-and-pointer structure, and the
;; interpretation of this as a tree.

;;                 ^
;;                / \
;;               1   ^ 
;;                  / \
;;                 2   ^
;;                    / \
;;                   3   4


(list 1 (list 2 (list 3 4)))
