;; The following pattern of numbers ic called Pascal's triangle.
;;           1
;;         1   1
;;       1   2   1
;;     1   3   3   1
;;   1   4   6   4   1
;; The numbers at the edge of the triangle are al1, and each number inside the triangle
;; is the sum of the two numbers above it. Write a procedure that computes elements
;; of Pasca's triangle by means of a recurseve proces.

(define (triangle row column)
  (cond ((or (= column 1)
             (= column row))
         1)
        ((or (< column 1)
             (< row column))
         0)
        (else (+ (triangle (- row 1) (- column 1))
                 (triangle (- row 1) column)))))

;; TEST
(triangle 7 4)   ; 20
