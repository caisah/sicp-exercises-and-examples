; Consider the sequence of expressions

(define sum 0)
(define (accum x)
  (set! sum (+ x sum)))

(define seq
  (stream-map accum
             (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))
(define z (stream-filter
           (lambda (x) (= (remainder x 5) 0)) seq))

(stream-ref y 7)
(display-stream z)

;; What is the value of sum after each of the above expressions is evaluated?
;; What is the printed response to evaluating the stream-ref and display-stream
;; expressions? Would these responses differ if we had implemented (delay <exp>)
;; simply as (lambda ()<exp>) without using the optimization provided by memo-proc?

;; seq:
;; '((sum 1) (sum 2) (sum 3) (sum 4) (sum 5) (sum 6)...(sum 20))
;;     1       3       6        10     15      21
;; y:
;; '((delayed 10)... (delayed 210))
;; z:
;; ((delayed 10) (delayed 15) ...(delayed 210))

(stream-ref y 7)
;; 120
;; sum 136


(display-stream z)
;; 10
;; 15
;; 45
;; 55
;; 105
;; 120
;; 190
;; 210
;; sum 210
