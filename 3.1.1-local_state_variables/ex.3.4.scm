;; Modify the make-account procedure of Ex.3.3 by adding another local state variable
;; so that if an account is accessed more than seven consecutive times with an incorrect
;; password int invokes the procedure call-the cops.


(define (make-account balance password)
  (define wrong-tries 0)
  (define (call-the-cops)
    "I just dialed 911. The cops know who you are!")
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (wrong-pass-message n)
    (set! wrong-tries (1+ wrong-tries))
    (if (> wrong-tries 7)
        (call-the-cops)
        "Incorrect password!"))
  (define (dispatch pass m)
    (if (not (eq? pass password))
        wrong-pass-message
        (begin
          (set! wrong-tries 0)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else
                 (error "Unknown request - MAKE-ACCOUNT" m))))))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
