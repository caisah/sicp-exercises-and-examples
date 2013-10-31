;; The encode procedure takes as arguments a message and a tree and produces the list of
;; bits that gives the encoded message.

;; Encode-symbol is a procedure, which you must write, that returns the list of bits that
;; returns the list of bits that encodes a given symbol according to a given tree. You
;; should design encode-symbol so that it signals an error if the symbol is not in the tree
;; at all. Test your procedure by encoding the result you obtained in Ex 2.67 with the
;; sample tree and seeing whether it is the same as the original sample message.

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree) 
  (cond 
   ((leaf? tree) '()) 
   ((member symbol (symbols tree)) 
    (let ((left (left-branch tree)) (right (right-branch tree))) 
      (if (member symbol (symbols left)) 
          (cons 0 (encode-symbol symbol left)) 
          (cons 1 (encode-symbol symbol right))))) 
   (else (error "bad symbol -- ENCODE-SYMBOL" symbol))))

(define message (list 'a 'd 'a 'b 'b 'c 'a))

(encode message sample-tree)
