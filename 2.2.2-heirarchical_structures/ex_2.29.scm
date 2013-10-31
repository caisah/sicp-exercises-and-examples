;; A binary mobile consists of two branches, a left branch and a right branch. Each branch
;; is a rod of certain length, from which hands either a weight or another binary mobile.
;; We can represent a binary mobile using compound data, by constructing it from two
;; branches (for example, using list):
;;   (define (make-mobile left right)
;;   (list left right))
;; A branch is constructed from a length (which must be a number) together with a structure,
;; which may be either a number (representing a simple weight) or another mobile:
;;   (define (make-branch length structure)
;;   (list length structure))

;; a. Write the corresponding selectors left-branch and right-branch, which return the
;; branches of a mobile, and branch-length and branch-structure, which return the
;; components of a branch.

;; b. Using your selectors, define a procedure total-weight that returns the total weight
;; of a mobile.

;; c. A mobile is said to be balanced if the torque applied by its top-left branch is
;; equal to that applied by its top-right branch (that is, if length of the rod multiplied
;; by the weight hanging from that rod is equal to the corresponding product side) and if
;; each of the submobiles hanging off its branches is balanced. Design a predicate that
;; tests whether a binary mobile is balanced.

;; d. Suppose we change the representation of mobiles so that the constructors are
;;   (define (make-mobile left right)
;;      (cons left right))

;;   (define (make-branch length structure)
;;      (cons length structure))
;; How much do you need to change your programs to convert to the new representation?


(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define m1
  (make-mobile (make-branch 1 2) (make-branch 3 4)))

(define m2
  (make-mobile (make-branch 1 2)
               (make-branch 4 (make-mobile (make-branch 3 3)
					   (make-branch 4 m2)))))

(define m3
  (make-mobile (make-branch 2 4) (make-branch 4 2)))

(define m4
  (make-mobile m3 m3))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (is-mobile? branch)
  (pair? (branch-structure branch)))

(define (is-unique? struct)
  (not (pair? struct)))

(define (weight branch)
  (cond ((is-unique? branch) 0)
	((is-mobile? branch) (total-weight branch))
	(else (branch-structure branch))))

(define (total-weight mobile)
  (+ (weight (left-branch mobile)) (weight (right-branch mobile))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (torque branch)
  (if (not (is-mobile? branch))
      (* (branch-structure branch) (branch-length branch))))

(define (balanced-mobile? mobile)
  (let ((is-left? (is-mobile? (left-branch mobile)))
	(is-right? (is-mobile? (right-branch mobile))))
	(cond ((and (not is-left?) (not is-right?))
	       (= (torque (left-branch mobile)) (torque (right-branch mobile))))
	      ((and is-left? is-right?)
	       (and  (balanced-mobile? (left-branch mobile))
			  (balanced-mobile? (right-branch mobile))))
	      (else #f))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
