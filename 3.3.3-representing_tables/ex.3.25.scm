;; Generalizing one and two-dimensional tables, show how to implement a table in which
;; values are stored under an arbitrary number of keys. The lookup and insert!
;; procedures should take as input a list of keys used to access the table.

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else
         (assoc key (cdr records)))))

(define (make-table)
  (list '*table*))

(define (lookup lst table)
  (let ((subtable (assoc (car lst) (cdr table))))
    (if (null? (cdr lst))
        (if subtable
            (cdr subtable)
            false)
        (if subtable
            (lookup (cdr lst) subtable)
            false))))

(define (insert! lst value table)
  (let ((subtable (assoc (car lst) (cdr table))))
    (if (null? (cdr lst))
        (if subtable
            (set-cdr! subtable value)
            (set-cdr! table
                      (cons (cons (car lst) value)
                            (cdr table))))
        (if subtable
            (insert! (cdr lst) value subtable)
            (set-cdr! table
                      (cons (make-tables lst value)
                            (cdr table)))))))

(define (make-tables lst value)
  (if (null? (cdr lst))
      (cons (car lst) value)
      (cons (car lst)
            (list (make-tables (cdr lst) value)))))


;; Testing
(define tb1 (list (list '*table*) (cons 'a 1) (cons 'b 2) (cons 'c 3)))
(lookup (list 'b) tb1)

(define tb2 (list (list '*table)
                  (list 'first (cons 'a 1) (cons 'b 2) (cons 'c 3))
                  (list 'second (cons 'aa 11) (cons 'bb 22) (cons 'cc 33))
                  (list 'third (list 'third-first (cons 'aaa 111) (cons 'bbb 333)))))
(lookup (list 'third 'third-first 'bbb) tb2)

(insert! (list 'd) 3 tb1)
(lookup (list 'd) tb1)
(insert! (list 'third 'third-first) 0 tb2)
(lookup (list 'third 'third-first) tb2)
(insert! (list 'forth 'x) 10 tb2)
(lookup (list 'forth 'x) tb2)
