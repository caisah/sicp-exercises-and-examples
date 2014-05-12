;; A famous problem, first raised by R. Hamming, is to enumerate, in ascending order
;; with no repetitions, all positives integers, with no prime factors other than
;; 2, 3, or 5. One obvious way to do this is to simply test each integer in turn to
;; see whether it has any factors other than 2, 3 and 5. Bu this is very inefficient,
;; since, as the integers get larger, fewer and fewer  of them fit the requirement.
;; AS an alternative, let us call the required streams of numbers S and notice the
;; following facts about it.
;; * S begins with 1.
;; * The elements of (scale-stream S 2) are also elements of S.
;; * The same is true for (scale-stream S 3) and (scale-stream S 5).
;; * These are all the elements of S.

;; Now all we have to do is combine elements from these sources. For this we define a
;; procedure merge that combines two ordered streams into one ordered result stream,
;; eliminating repetitions:

(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< s1car s2car)
                  (cons-stream
                   s1car
                   (merge (stream-cdr s1) s2)))
                 ((> s1car s2car)
                  (cons-stream
                   s2car
                   (merge s1 (stream-cdr s2))))
                 (else
                  (cons-stream
                   s1car
                   (merge (stream-cdr s1)
                          (stream-cdr s2)))))))))

;; Then the required stream may be constructed with merge, as follows:

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define two-stream
  (cons-stream 1 (scale-stream two-stream 2)))

(define three-stream
  (cons-stream 1 (scale-stream three-stream 3)))

(define five-stream
  (cons-stream 1 (scale-stream five-stream 5)))

(define S (cons-stream 1 (merge (merge two-stream three-stream) five-stream)))

