;; Write a procedure that examines a list and determines whether it contains a cycle, that
;; is, whether a program that tried to find the end of the list by taking successive
;; cdrs would go into an infinite loop.


(define l (list 1 2))
(set-cdr! l l)

(define (check-cycle lst)
  (define visited '())
  (define (check lst)
    (cond ((null? lst) #f)
          ((memq (car lst) visited) #t)
          (else
           (set! visited (cons (car lst) visited))
           (check (cdr lst)))))
  (check lst))

(check-cycle (list 1 2 3))
(check-cycle l)

