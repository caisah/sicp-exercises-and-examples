;; Implement the lookup procedure for the case where the set of records is structured as
;; a binary tree, ordered by the numerical values of the keys.

(define (lookup given-key set-of-records) 
  (cond ((null? set-of-records) false) 
        ((= given-key (key (entry set-of-records))) 
         (entry set-of-records)) 
        ((< given-key (key (entry set-of-records))) 
         (lookup given-key (left-branch set-of-records))) 
        (else (lookup given-key (right-branch set-of-records))))) 
