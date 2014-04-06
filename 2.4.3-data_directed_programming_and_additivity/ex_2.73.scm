;; Section 2.3.2 described a program that performs symbolic differentiation:

;; (define (deriv exp var)
;;   (cond ((number? exp) 0)
;;         ((sum? exp) (if (same-variable? exp var) 1 0))
;;         ((sum? exp)
;;          (make-sum (deriv (addend exp) var)
;;                    (deriv (augend exp) var)))
;;         (product? exp)
;;         (make-sum
;;           (make-product (multiplier exp)
;;                         (deriv (multiplicand exp) var))
;;           (make-product (deriv (multiplier exp) var)
;;                         (multiplicand exp)))
;;         (else (error "unknown expression type - DERIV" exp))))

;; We can regard this program as performing a dispatch on the type of the expression
;; to  be differentiated. In this situation the "type tag" of the datum is the
;; algebraic operator symbol(such as +) and the operation being performed is deriv.
;; We can transform this program into data-directed style by rewriting the basic
;; derivative procedure as

;; (define (deriv exp var)
;;   (cond ((number? exp) 0)
;;         ((variable? exp)
;;          (if (same-variable? exp var) 1 0))
;;         (else
;;          ((get 'deriv (operator exp))
;;           (operands exp)
;;           var))))

;; (define (operator exp) (car exp))
;; (define (operands exp (cdr exp)))

;; a. Explain what was done above. why can't we assimilate the predicates number?
;; and variable? into the data directed dispatch?

;; b. Write the procedures for derivatives of sums and products and the auxiliary code
;; required to install them in the table used by the program above.

;; c. Choose any additional differentiation rule that you like such as one for
;; exponents (Ex. 2.56) and install it in this data-directed system.

;; d. In this simple algebraic manipulator the type of the expression is the algebraic
;; operator that binds it together. Suppose, however, we indexed the procedures in the
;; opposite ways, so that the dispatch line in deriv looked like
;; ((get (operator exp) 'deriv) (operands exp) var)
;; What corresponding changes to the derivative system are required?


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        (else
         ((get 'deriv (operator exp))
          (operands exp)
          var))))

(define (install-sum-package) 

  (define (sum-deriv expr var) 
    (make-sum (deriv (addend expr) var) 
              (deriv (augend expr) var)))
  
  (define (addend expr) (car expr))
  
  (define (augend expr) (cadr expr))
  
  (define (make-sum x1 x2) 
    (cond ((and (number? x1) (number? x2)) (+ x1 x2)) 
          ((=number? x1 0) x2) 
          ((=number? x2 0) x1) 
          (else (list '+ x1 x2))))
  
  (define (mul-deriv expr var) 
    (make-sum (make-product (multiplier expr) 
                            (deriv (multiplicand expr) var)) 
              (make-product (multiplicand expr) 
                            (deriv (multiplier expr) var))))
  
  (define (multiplier expr) (car expr))
  
  (define (multiplicand expr) (cadr expr))
  
  (define (make-product x1 x2) 
    (cond ((and (number? x1) (number? x2)) (* x1 x2)) 
          ((=number? x1 1) x2) 
          ((=number? x2 1) x2) 
          ((or (=number? x1 0) (=number? x2 0)) 0) 
          (else (list '* x1 x2)))) 
  
  (put 'deriv '+ sum-deriv) 
  (put 'deriv '* mul-deriv)) 


(define (exponentation-deriv expr var) 
  (make-product (exponent expr) 
                (make-product  
                 (make-exponentiation (base expr) 
                                      (make-sum (exponent expr) -1)) 
                 (deriv (base expr) var)))) 

(define (exponent expr) 
  (cadr expr))

(define (base expr) 
  (car expr))

(define (make-exponentiation base exponent) 
  (cond ((=number? exponent 0) 1) 
        ((=number? exponent 1) base) 
        ((=number? base 1) 1) 
        (else (list '** base exponent)))) 

(put 'deriv '** exponentiation-deriv) 
