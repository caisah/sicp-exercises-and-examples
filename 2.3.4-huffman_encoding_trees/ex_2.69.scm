;; The following procedure takes as its argument a list of symbols-frequency pairs
;; (where no symbol appears in more than one pair) and generates a huffman encoding tree
;; according to the Huffman algorithm.

;; Make-leaf-set is the procedure given that transforms the list of pairs into an ordered
;; set of leaves. Successive-merge is the procedure you must write using make-code-tree
;; to successively merge the smallest weight elements of the set until there is only one
;; element left, which is the desired Huffman tree. (This procedure is slightly tricky
;; but not really complicated. If you find yourself designing a complex procedure, then
;; you are almost certainly doing something wrong.. You can take significant advantage of
;; the fact that we are suing an ordered set representation.)

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves) 
   (if (null? (cdr leaves)) 
       (car leaves) 
       (successive-merge 
        (adjoin-set (make-code-tree (car leaves) (cadr leaves)) 
                    (cddr leaves))))) 

