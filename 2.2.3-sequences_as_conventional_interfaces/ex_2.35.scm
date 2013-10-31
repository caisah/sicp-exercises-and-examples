;; Redefine count-leaves from Section 2.2.2 as an accumulation:
;;  (define (count-leaves t)
;;    (accumulate <??> <??>  (map <??> <??>)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map
                   (lambda (s) (if (pair? s)
                              (count-leaves s)
                              1)) t)))

(define l (list 1 (list 4 5) (list 3 (list 4 5))))

(count-leaves l)
