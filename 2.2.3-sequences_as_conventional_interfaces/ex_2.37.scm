;; Suppose we represent vectors v = (vi) as sequences of numbers, and matrices m = (mij)
;; as sequences of vectors (the rows of the matrix). For example, the matrix
;;      1  2  3  4
;;      4  5  6  6
;;      6  7  8  9
;; is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8 9)). With this representation
;; we can use sequence operations to concisely express the basic matrix and vector
;; operations. These operations (which are described in any book on matrix algebra)
;; are the following:

;;  (dot-product v w) returns the sum viwi
;; (matrix-*-vector m v) returns the vector t, where ti = sum mij vj
;; (matrix-*-matrix m n) returns the matrix p, where pij = sum mik nkj
;; (transpose m) returns the matrix n, where nij = mji

;; We can define the dot product as
;;   (define (dot-product v w)
;;      (accumulate + 0 (map * v w)))

;; Fill in the missing expressions in the following procedures for computing the other
;; matrix operations. (The procedure accumulate-n is defined in Ex 2.36)

;;  (define (matrix-*-vector m v)
;;    (map  <??> m))

;; (define (transpose mat)
;;   (accumulate-n <??> <??> mat))

;; (define (matrix-*-matrix m n)
;;   (let ((cols (transpose n)))
;;     (map <??> m)))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define  nil '())

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define vector (list 1 2 3 4))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product vector vector)


(define (matrix-*-vector m v) 
   (map (lambda (m-row) (dot-product m-row v)) 
        m))

(matrix-*-vector matrix vector)


(define (transpose mat)
  (accumulate-n cons '() mat))

(transpose matrix)


(define (matrix-*-matrix m n) 
   (let ((n-cols (transpose n))) 
     (map (lambda (m-row) 
            (map (lambda (n-col)  
                   (dot-product m-row n-col))  
                 n-cols)) 
          m)))
(matrix-*-matrix matrix matrix)
