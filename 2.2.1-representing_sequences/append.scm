(define squares (list 1 4 9 16 25))
(define odds (list 1 3 5 7))

(append squares odds)  ; (1 4 9 16 25 1 3 5 7)

(append odds squares)  ; (1 3 5 7 1 4 9 16 25)

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(append (list 1 2 3) (list 4 5 6)) ; (1 2 3 4 5 6)
