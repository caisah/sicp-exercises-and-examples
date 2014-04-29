;; A dequeue ("double-ended queue") is a sequence in which items can be inserted and
;; deleted at either the front or the rear. Operations on deques are the constructor
;; make-dequeue, the predicate empty-dequeue?, selectors front-dequeue, rear-dequeue,
;; and mutators front-insert-dequeue and rear-delete-dequeue!. Show how to represent
;; dequeues using pairs and give implementations of the operations. All operations should
;; be accomplished in Θ(1) steps.

(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (set-front-ptr! deque item) (set-car! deque item))
(define (set-rear-ptr! deque item) (set-cdr! deque item))
(define (make-deque) (cons '() '()))
(define (empty-deque? deque) 
  (and (null? (front-ptr deque))
       (null? (rear-ptr deque))))

(define (print-deque deque)
  (define (make-printable-list q)
    (if (null? q)
        '()
        (cons (car q) 
              (make-printable-list (cddr q)))))
  (newline)
  (display (make-printable-list (front-ptr deque))))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item (cons '() '()))))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair))
          (else
           (set-car! (cdr new-pair) (rear-ptr deque))
           (set-cdr! (cdr (rear-ptr deque)) new-pair)
           (set-rear-ptr! deque new-pair)))))

(define (front-insert-deque! deque item)
  (let ((new-pair (cons item (cons '() '()))))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair))
          (else
           (set-cdr! (cdr new-pair) (front-ptr deque))
           (set-car! (cdr (front-ptr deque)) new-pair)
           (set-front-ptr! deque new-pair)))))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with an empty deque" deque)
      (car (front-ptr deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with an empty deque" deque)
      (car (rear-ptr deque))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "FRONT-DELETE! called with an empty deque" deque))
        ((eq? (front-ptr deque) (rear-ptr deque))
         (set-front-ptr! deque '())
         (set-rear-ptr! deque '()))
        (else
         (set-front-ptr! deque (cddr (front-ptr deque)))
         (set-car! (cdr (front-ptr deque)) '()))))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "REAR-DELETE! called with an empty deque" deque))
        ((eq? (front-ptr deque) (rear-ptr deque))
         (set-front-ptr! deque '())
         (set-rear-ptr! deque '()))
        (else
         (set-rear-ptr! deque (cadr (rear-ptr deque)))
         (set-cdr! (cdr (rear-ptr deque)) '()))))

