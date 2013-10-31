;; Consider the change-counting program of Section 1.2.2. It would be nice to be able
;; to easily change the currency used by the program, so that we could compute the
;; number of ways to change a British pound, for example. As the program is written,
;; the knowledge of the currency is distributed partly into the procedure count-change
;; (which knows that there are five kinds of U.S coins). It would be nicer to be able
;; to supply a list of coins to be used for making change.
;; We want to rewrite the procedure cc so that its second argument is a list of the
;; values of the coins to user rather than an integer specifying which coin to use. We
;; could have lists that defined each kind of currency:
;;  (define us-coins (list 50 25 10 5 1))
;;  (define uk-coins (list 100 50 20 10 6 2 1 0.5))
;; We could then call cc as follows:
;;  (cc 100 us-coins)
;;  292
;; To do this will require changing the program cc somewhat. It will still have the same
;; form, but it will access its second argument differently, as follows:

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount (first-denomination coin-values))
                coin-values)))))

;; Define the procedure first-denomination, except-first-denomination and no-more? in terms
;; of primitive operations on list structures. Does the order of the list coin-values
;; affect the answer produced by cc?

(define no-more? null?) 
(define except-first-denomination cdr)
(define first-denomination car)

(cc 100 (list 50 25 10 5 1))
