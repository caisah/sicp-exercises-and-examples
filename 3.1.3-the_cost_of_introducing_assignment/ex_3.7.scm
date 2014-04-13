;; Consider the bank account objects created by make-account, with the password modification
;; described in Ex.3.3. Suppose that our banking system requires the ability to make
;; joint accounts. Define a procedure make-joint that accomplishes this. Make joint should
;; take three arguments. The first is a password protected account. The second argument
;; must match the password with which the account was defined in order for the make-joint
;; operation to proceed. The third argument is a new password. Make joint is to create an
;; additional access to the original account using the new password. For example, if
;; peter-acc is a bank account with password open-sesame, then
;;   (define paul-acc
;;     (make-joint peter-acc 'open-sesame 'rosebud))
;; will allow one to make transactions on peter acc using the name paul-acc and the password
;; rosebud. You may wish to modify your solution to Ex.3.3 to accommodate this new feature.
(define (make-account balance password)
  
  (define (add-pass p)
    (if (symbol? p)
        (set! password (cons p (list password)))
        (set! password (cons p password)))
    (display password)
    password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (in? p-lst p)
    (if (symbol? p-lst) (eq? p-lst p)
        (cond ((null? p-lst) #f)
              ((eq? p (car p-lst)) #t)
              (else
               (in? (cdr p-lst) p)))))
  (define (wrong-pass-message n)
    "Incorrect password!")
  (define (dispatch pass m)
    (if (not (in? password pass))
        wrong-pass-message
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              ((eq? m 'add-pass) add-pass)
              (else
               (error "Unknown request - MAKE-ACCOUNT" m)))))
  dispatch)

(define peter-acc (make-account 100 'secret-password))
((peter-acc 'secret-password 'withdraw) 40)

(define (make-joint current-account pass new-pass)
  ((current-account pass 'add-pass) new-pass)
  current-account)

(define paul-acc (make-joint peter-acc 'secret-password 'rosebud))

((peter-acc 'secret-password 'deposit) 10)
((paul-acc 'rosebud 'withdraw) 10)
