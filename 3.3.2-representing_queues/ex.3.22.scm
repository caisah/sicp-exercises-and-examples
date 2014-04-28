;; Instead of representing a queue as a pair of pointers, we can build a queue as a procedure
;; with local state. The local state will consist of pointers to the beginning and
;; the end of an ordinary list. Thus, the make-queue procedure will have the form:

;; (define (make-queue)
;;   (let ((front-ptr ...)
;;         (rear-ptr ...))
;;     <definitions of internal procedures>
;;     (define (dispatch m) ...)
;;     dispatch))

;; Complete the definition of make-queue and provide implementations of the queue operations
;; using this representation.

(define (make-queue) 
  (let ((front-ptr '()) 
        (rear-ptr '())) 
    (define (emtpy-queue?) (null? front-ptr)) 
    (define (set-front-ptr! item) (set! front-ptr item)) 
    (define (set-rear-ptr! item) (set! rear-ptr item)) 
    (define (front-queue)  
      (if (emtpy-queue?) 
          (error "FRONT called with an empty queue") 
          (car front-ptr))) 
    (define (insert-queue! item) 
      (let ((new-pair (cons item '()))) 
        (cond ((emtpy-queue?) 
               (set-front-ptr! new-pair) 
               (set-rear-ptr! new-pair)) 
              (else  
               (set-cdr! rear-ptr new-pair) 
               (set-rear-ptr! new-pair))))) 
    (define (delete-queue!) 
      (cond ((emtpy-queue?) 
             (error "DELETE called with an emtpy queue")) 
            (else (set-front-ptr! (cdr front-ptr))))) 
    
    (define (print-queue) front-ptr) 
    
    (define (dispatch m) 
      (cond ((eq? m 'empty-queue) emtpy-queue?) 
            ((eq? m 'front-queue) front-queue) 
            ((eq? m 'insert-queue!) insert-queue!) 
            ((eq? m 'delete-queue!) delete-queue!) 
            ((eq? m 'print-queue) print-queue) 
            (else (error "undefined operation -- QUEUE" m)))) 
    dispatch))

(define q (make-queue))
(define (empty-queue?)
  ((q 'empty-queue)))
(define (insert-queue value)
  ((q 'insert-queue!) value))
(define (delete-queue)
  ((q 'delete-queue!)))
(define (print-queue)
  ((q 'print-queue)))

(insert-queue 10)
(empty-queue?)
(insert-queue 20)
(print-queue)
(delete-queue)
(print-queue)


