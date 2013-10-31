;; Fill in the missing expressions to complete the following definitions of some basic
;; list manipulation operations as accumulations:

;; (define (map p sequence)
;;   (accumulate (lambda (x y) <??>) nil sequence))

;; (define (append seq1 seq2)
;;  (accumulate cons <??>  <??>))

;; (define (length sequence)
;;   (accumulate <??> 0 sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())


(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
(map 1+ (list 1 2 3))


(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
(append (list 1 2 3) (list 4 5))


(define (length sequence)
  (accumulate (lambda (x y) (1+ y)) 0 sequence))
(length (list 1 2 3 4))
