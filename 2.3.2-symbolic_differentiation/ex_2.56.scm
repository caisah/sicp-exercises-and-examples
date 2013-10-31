;; Show how to extend the basic differentiator to handle more kinds of expressions. For
;; instance, implement the differentiation rule
;;    d(u^n)/dx = n u^(n-1) du/dx
;; by adding a new clause to the deriv program, and make-exponentiation. (You may use
;; the symbol ** to denote exponentiation.) Build in the rules that anything raised to
;; the power of 0 is 1 and anything raised to the power 1 is the thing itself.

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))


(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))


(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

;; -------------------------------------------------------------

(define (exp? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x) (cadr x))

(define (exponent x) (caddr x))

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list '** b e))))


(define (deriv expr var) 
  (cond ((number? expr) 0) 
        ((variable? expr) 
         (if (same-variable? expr var) 1 0)) 
        ((sum? expr)  
         (make-sum (deriv (addend expr) var) 
                   (deriv (augend expr) var))) 
        ((product? expr)  
         (make-sum 
          (make-product (multiplier expr) 
                        (deriv (multiplicand expr) var)) 
          (make-product (multiplicand expr) 
                        (deriv (multiplier expr) var)))) 
        ((exponentiation? expr)  
         (make-product  
          (make-product  
           (exponent expr)
           (make-exponentiation (base expr)
                                (make-sum (exponent expr) -1)))
          (deriv (base expr) var)))
        (else (error "unkown expression type -- DERIV" expr))))
