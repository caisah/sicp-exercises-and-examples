;; Each of the following two procedures converts a binary tree to a list.

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

;; a. Do the two procedures produce the same result for every tree? If not, how do the
;;    results differ? What lists do the two procedures produce for the trees in the
;;    figures?

;; b. Do the two procedures have the same order of growth in the number of steps required
;;    to convert a balanced tree with n elements to a list? If not, which one grows more
;;    slowly?


;;         7
;;        / \
;;       3   9
;;      / \   \
;;     1   5  11

(define set1 (make-tree 7
                        (make-tree 3
                                   (make-tree 1 '() '())
                                   (make-tree 5 '() '()))
                        (make-tree 9
                                   '()
                                   (make-tree 11 '() '()))))

;;         3
;;        / \
;;       1   7
;;          / \
;;         5   9
;;              \
;;              11

(define set2 (make-tree 3
                        (make-tree 1 '() '())
                        (make-tree 7
                                   (make-tree 5 '() '())
                                   (make-tree 9
                                              '()
                                              (make-tree 11 '() '())))))

;;         5
;;        / \
;;       3   9
;;      /   / \
;;     1   7  11


(define set3 (make-tree 5
                       (make-tree 3
                                  (make-tree 1 '() '())
                                  '())
                       (make-tree 9
                                  (make-tree 7 '() '())
                                  (make-tree 11 '() '()))))

(tree->list-1 set1)
(tree->list-2 set1)
(tree->list-1 set2)
(tree->list-2 set2)
(tree->list-1 set3)
(tree->list-2 set3)
