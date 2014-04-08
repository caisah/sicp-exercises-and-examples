;; Using the raise operation of Ex 2.83, modify the apply-generic procedure so that it
;; coerces its arguments to have the same type by the method of successive raising as
;; discussed in this section. You will need to devise a way to test which of the
;; ow types is higher in the tower. Do this in a manner that is compatible with the rest
;; of the system and will not lead to problems in adding new levels to the tower.

;; This solution is for an apply-generic that works with arbitrary arguments 
;; by raising all to the highest type. 
;; New types can be added to the tower easily. Only the procedure "level" has 
;; to be modified. 

(define (level type) 
  (cond ((eq? type 'integer) 0) 
        ((eq? type 'rational) 1) 
        ((eq? type 'real) 2) 
        ((eq? type 'complex) 3) 
        (else (error "Invalid type: LEVEL" type)))) 

(define (apply-generic op . args) 
  (let ((type-tags (map type-tag args))) 
    (define (no-method) 
      (error "No method for these types" (list op type-tags))) 
    (let ((proc (get op type-tags))) 
      (if proc 
          (apply proc (map contents args)) 
          (if (not (null? (cdr args))) ; length of args > 1 
              (let ((raised-args (raise-to-common args))) 
                (if raised-args 
                    (let ((proc (get op (map type-tag raised-args)))) 
                      (if proc 
                          (apply proc (map contents raised-args)) 
                          (no-method))) 
                    (no-method))) 
              (no-method)))))) 

(define (raise-to-common args) 
  (let ((raised-args 
         (map (lambda (x) (raise-to-type (highest-type args) x)) 
              args))) 
    (if (all-true? raised-args) 
        raised-args 
        false))) 

(define (all-true? lst) 
  (cond ((null? lst) true) 
        ((car lst) (all-true? (cdr lst))) 
        (else false))) 

(define (raise-to-type type item) 
  (let ((item-type (type-tag item))) 
    (if (eq? item-type type) 
        item 
        (let ((raise-fn (get 'raise item-type))) 
          (if raise-fn 
              (raise-to-type type (raise-fn item)) 
              false))))) 

(define (highest-type args) 
  (if (null? (cdr args)) 
      (type-tag (car args)) 
      (let ((t1 (type-tag (car args))) 
            (t2 (highest-type (cdr args)))) 
        (let ((l1 (level t1)) (l2 (level t2))) 
          (if (> l1 l2) t1 t2))))) 

