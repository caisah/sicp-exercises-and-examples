(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(memq 'apple '(pear banana prune))
;; #f
(memq 'apple '(x (apple sauce) y apple pear))
;; (apple pear)
