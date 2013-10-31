(define one-through-four
  (list 1 2 3 4))

one-through-four     ; (1 2 3 4)
(car one-through-four)   ; 1
(cdr one-through-four)   ; (2 3 4)
(car (cdr one-through-four))  ; 2
(cons 10 one-through-four)    ; (10 1 2 3 4)
