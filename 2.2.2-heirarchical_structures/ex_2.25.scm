;; Give combinations of cars and cdrs that will pick 7 from each of the following lists


;; (1 2 (5 7) 9)
(define a (list 2 3 (list 5 7) 9))
(cdr (car (cdr (cdr a))))

;; ((7))
(define b (list (list 7)))
(car (car b))

;; (1 (2 (3 (4 (5 (6 7))))))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c))))))))))))

