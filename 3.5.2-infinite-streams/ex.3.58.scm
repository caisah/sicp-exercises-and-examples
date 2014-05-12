;; Give an interpretation of the stream computed by the following procedure:
(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

;; Quotient is a primitive that returns the integer quotient of two integers.
;; What are the successive elements produced by (expand 1 7 10)?
;; What is produced by (expand 3 8 10)?


;; The result is the rational value that num divide den in base radix.
;; (expand 1 7 10)
;; 1 4 2 8 5 7 4 2 8 5 7 ...
;; (expand 3 8 10)
;; 3 7 5 0 0 0 ...
