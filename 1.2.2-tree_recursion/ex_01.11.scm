;; A function f is defined by the rule that f(n) = n if n < 3
;; and f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3. Write a procedure that computes
;; f by means of a recursive process. Write a procedure that computes f by means of
;; an iterative process.


; Recursive

(define (f n)
  (cond ((= n 1) 1)
        ((= n 2) 2)
        ((= n 3) 3)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))


; Iterative

(define (f n)
  
(define (iter n1 n2 n3 count)
  (if (= count 3)
      n1
      (iter (+ n1 (* 2 n2) (* 3 n3)) n1 n2 (- count 1))))

(cond ((= n 1) 1)
      ((= n 2) 2)
      ((= n 3) 3)
      (else (iter 3 2 1 n))))
