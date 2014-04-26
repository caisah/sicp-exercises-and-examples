;; Redo Ex. 3.18 using an algorithm that takes only a constant amount of space.
;; (This requires a very clever idea).
(define (contains-cycle? lst) 
  (define (safe-cdr l) 
    (if (pair? l) 
        (cdr l) 
        '())) 
  (define (iter a b) 
    (cond ((not (pair? a)) #f) 
          ((not (pair? b)) #f) 
          ((eq? a b) #t) 
          ((eq? a (safe-cdr b)) #t) 
          (else (iter (safe-cdr a) (safe-cdr (safe-cdr b)))))) 
  (iter (safe-cdr lst) (safe-cdr (safe-cdr lst))))
