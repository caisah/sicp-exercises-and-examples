;; A dequeue ("double-ended queue") is a sequence in which items can be inserted and
;; deleted at either the front or the rear. Operations on deques are the constructor
;; make-dequeue, the predicate empty-dequeue?, selectors front-dequeue, rear-dequeue,
;; and mutators front-insert-dequeue and rear-delete-dequeue!. Show how to represent
;; dequeues using pairs and give implementations of the operations. All operations should
;; be accomplished in Θ(1) steps.

(define (front-ptr dq)
  (car dq))

(define (rear-ptr dq)
  (cdr dq))

(define (set-front-dequeue dq item)
  (set-car! dq item))

(define (set-rear-dequeue dq item)
  (set-cdr! dq item))

(define (make-dequeue)
  (list '() '() '()))

(define (empty-dequeue? dq)
  (null? (car dq)))

(define (front-dequeue dq)
  (if (empty-dequeue? dq)
      (error "FRONT called on a empty dequeue")
      (car (font-dqueue dq))))

(define (rear-dequeue dq)
  (if (empty-dequeue dq)
      (error ("REAR called on an empty dequeue"))
      (cddr dq)))

(define d (make-dequeue))
(set-front-dequeue d 10)
(set-rear-dequeue d 20)





