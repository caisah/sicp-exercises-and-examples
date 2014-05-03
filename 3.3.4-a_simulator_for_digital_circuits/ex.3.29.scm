;; Another way to construct an or-gate is as a compound digital logic device, built from
;; and-gates and inverters. Define a procedure or-gate that accomplishes this. What is
;; the delay time of the or-gate in terms of and-gate-delay and inverter delay?


(define (or-gate a1 a2 output) 
  (let ((b1 (make-wire)) 
        (b2 (make-wire)) 
        (b3 (make-wire))) 
    (inverter a1 b1) 
    (inverter a2 b2) 
    (and-gate b1 b2 b3) 
    (inverter b3 output)))

;; sum of the delays for inverter and and-gate used in or-gate
