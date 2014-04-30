;; IN the table implementations above, the keys are tested for equality using equal?
;; (called by assoc). This is not always the appropriate test. For instance, we might
;; have a table with numeric keys in which we don't need an exact match tot eh number
;; we're looking up, but only a number within some tolerance of it. Design a table
;; constructor make-table that takes as an argument a same-key? procedure that will be
;; used to test "equality" of keys. Make-table should return a dispatch procedure
;; that can be used to access appropriate lookup and insert! procedures fro a local table.

(define (make-table same-key?)
  (let ((local-table (list '*table*)))

    (define (assoc key records)
      (cond ((null? records) false)
            ((same-key? key (caar records)) (car records))
            (else (assoc key (cdr records)))))

    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)
    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else
             (error "Unknown operation - TABLE" m))))
    dispatch))

(define operation-table (make-table equal?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put 'first 'a 1)
(put 'first 'b 2)
(put 'second 'aa 11)
(put 'second 'bb 22)
(put 'third 'cc 33)
(get 'first 'b)
(get 'third 'cc)
