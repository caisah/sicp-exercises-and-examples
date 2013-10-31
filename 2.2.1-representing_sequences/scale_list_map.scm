(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

(scale-list (list 1 2 3 4) 2)
