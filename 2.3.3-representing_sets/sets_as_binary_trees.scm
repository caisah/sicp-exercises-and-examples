(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
        (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define set (make-tree 5
                       (make-tree 3
                                  (make-tree 1 '() '())
                                  '())
                       (make-tree 9
                                  (make-tree 7 '() '())
                                  (make-tree 11 '() '()))))
(entry set)
(left-branch set)
(right-branch set)
(element-of-set? 11 set)
(element-of-set? 32 set)
(define new-set (adjoin-set 14 set))
(element-of-set? 14 new-set)
