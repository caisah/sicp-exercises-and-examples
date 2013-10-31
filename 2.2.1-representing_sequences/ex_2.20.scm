;; Write a procedure same-parity that takes one or more integers and returns a list
;; of all the arguments that have the same even-odd parity as the first argument. For
;; example:
;;   (same-parity 1 2 3 4 5 6 7)
;;   (1 3 5 7)
;;   (same-parity 2 3 4 5 6 7)
;;   (2 4 6)

(define (same-parity . w)
  (define rem (remainder (car w) 2))
  (define (sp-iter items res)
    (if (null? items)
               res
               (if (= (remainder (car items) 2) rem)
                   (sp-iter (cdr items)
                            (append res (list (car items))))
                   (sp-iter (cdr items) res))))
  (sp-iter w '()))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
