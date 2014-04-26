;; Devise a correct version of the count-pairs procedure of Ex. 3.16 that returns the
;; number of distinct pairs in any structure. (Hint: Traverse the structure, maintaining
;; an auxiliary data structure that is used to keep track of which pairs have already
;; been counted.)


(define (count-pairs x)
  (define visited '())
  (define (count x)
    (if (or (memq x visited)
            (not (pair? x)))
        0
        (begin
          (set! visited (cons x visited))
          (+ (count-pairs (car x))
             (count-pairs (cdr x))
             1))))
  (count x))
