;; Modify the make-account procedure so that it creates password-protected accounts.
;; This is, make-account should take a symbol as an additional argument, as in
;;   (define acc (make-account 100 'secret-password))
;; The resulting account object should process a request only if  it is accompanied by
;; the password with which the account was created, and should otherwise return
;; a complaint:
;;   ((acc 'secret-password 'withdraw) 40)
;;   60

;;   ((acc 'some-other-password 'deposit) 50)
;;   "Incorrect password"

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (wrong-pass-message n)
    "Incorrect password!")
  (define (dispatch pass m)
    (if (not (eq? pass password))
        wrong-pass-message
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else
               (error "Unknown request - MAKE-ACCOUNT" m)))))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
