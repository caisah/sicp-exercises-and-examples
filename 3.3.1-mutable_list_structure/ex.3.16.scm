;; Ben Bitdiddle decides to write a procedure to count the number of pairs in any list
;; structure. "It's easy", he reasons. "The number of pairs in any structure is the number
;; in car plus the number in cdr plu one more to count the current pair." So Ben writes
;; the following procedure:

  (define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1)))

;; Show that this procedure is not correct. In particular, draw a box-and-pointer diagrams
;; representing list stsructures made up of exacly three pairs for wich Ben's procedure
;; would return 3; return 4; return 7, never return at all


(count-pairs (list 'a 'b 'c))

(define second (cons 'a 'b))
(define third (cons 'a 'b))
(define first (cons second third))
(set-car! third second)
(count-pairs first)  ;; => 4 

(define third (cons 'a 'b)) 
(define second (cons third third)) 
(define first (cons second second)) 
(count-pairs first)  ;; => 7 

(define lst (list 'a 'b 'c)) 
(set-cdr! (cddr lst) lst) 
(count-pairs lst)  ;; never returns 
