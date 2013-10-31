;; In passing, Ben, also cryptically comments: "By testing the signes of the endpoints
;; of the intervals, it is possible to break mul-interval into nine cases, only one
;; of which requires more than two multiplications." Rewrite this procedure using Ben's
;; suggestion.

(define (make-interval a b) (cons a b)) 
(define (upper-bound interval) (max (car interval) (cdr interval))) 
(define (lower-bound interval) (min (car interval) (cdr interval))) 

(define (print-interval name i) 
  (newline) 
  (display name) 
  (display ": [") 
  (display (lower-bound i)) 
  (display ",") 
  (display (upper-bound i)) 
  (display "]")) 

;; Old multiplication (given) 
(define (old-mul-interval x y) 
  (let ((p1 (* (lower-bound x) (lower-bound y))) 
        (p2 (* (lower-bound x) (upper-bound y))) 
        (p3 (* (upper-bound x) (lower-bound y))) 
        (p4 (* (upper-bound x) (upper-bound y)))) 
    (make-interval (min p1 p2 p3 p4) 
                   (max p1 p2 p3 p4)))) 


;; This looks a *lot* more complicated to me, and with the extra 
;; function calls I'm not sure that the complexity is worth it. 
(define (mul-interval x y) 
  ;; endpoint-sign returns: 
  ;;     +1 if both endpoints non-negative, 
  ;;     -1 if both negative, 
  ;;      0 if opposite sign 
  (define (endpoint-sign i) 
    (cond ((and (>= (upper-bound i) 0) 
                (>= (lower-bound i) 0)) 
           1) 
          ((and (< (upper-bound i) 0) 
                (< (lower-bound i) 0)) 
           -1) 
          (else 0))) 
  
  (let ((es-x (endpoint-sign x)) 
        (es-y (endpoint-sign y)) 
        (x-up (upper-bound x)) 
        (x-lo (lower-bound x)) 
        (y-up (upper-bound y)) 
        (y-lo (lower-bound y))) 
    
    (cond ((> es-x 0) ;; both x endpoints are +ve or 0 
           (cond ((> es-y 0) 
                  (make-interval (* x-lo y-lo) (* x-up y-up))) 
                 ((< es-y 0) 
                  (make-interval (* x-up y-lo) (* x-lo y-up))) 
                 (else 
                  (make-interval (* x-up y-lo) (* x-up y-up))))) 
          
          ((< es-x 0) ;; both x endpoints are -ve 
           (cond ((> es-y 0) 
                  (make-interval (* x-lo y-up) (* x-up y-lo))) 
                 ((< es-y 0) 
                  (make-interval (* x-up y-up) (* x-lo y-lo))) 
                 (else 
                  (make-interval (* x-lo y-up) (* x-up y-lo))))) 
          
          (else  ;; x spans 0 
           (cond ((> es-y 0) 
                  (make-interval (* x-lo y-up) (* x-up y-up))) 
                 ((< es-y 0) 
                  (make-interval (* x-up y-lo) (* x-lo y-lo))) 
                 (else 
                  ;; Both x and y span 0 ... need to check values 
                  (make-interval (min (* x-lo y-up) (* x-up y-lo)) 
                                 (max (* x-lo y-lo) (* x-up y-up))))))))) 
