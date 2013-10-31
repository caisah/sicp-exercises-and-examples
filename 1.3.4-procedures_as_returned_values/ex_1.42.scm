;; Let f and g be two functions. The composition f after g is defined to be the function
;; x -> f(g(x)). Define a procedure compose that implements composition. For example
;; if inc is a procedure that adds 1 to its argument,
;;   ((compose square inc) 6)
;;   49

(define (inc x)
  (+ x 1))

(define (compose f g)
  (lambda (y) (f (g y))))

((compose square inc) 6)
