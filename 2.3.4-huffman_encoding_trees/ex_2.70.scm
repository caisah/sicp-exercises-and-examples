;; The following eight-symbol alphabet with associated relative frequencies was designed
;; to efficiently encode the lyrics of 1950s rock songs.

;; A 2
;; BOOM 1
;; GET 2
;; JOB 2
;; NA 16
;; SHA 3
;; YIP 9
;; WAH 1

;; Use generate-huffman-tree to generate a corresponding Huffman tree, and use encode
;; to encode the following message:

;; Get a job
;; Sha na na na na na na na
;; Get a job
;; Sha na na na na na na na
;; Wah yip yip yip yip yip yip yip yip yip
;; Sha boom

;; How many bits are required for encoding? What is the smallest number of bits that
;; would be needed to encode this song if we used a fixed length code for the eight-symbol
;; alphabet?

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit - choose-branch" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)        ; symbol
                               (cadr pair))      ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves) 
   (if (null? (cdr leaves)) 
       (car leaves) 
       (successive-merge 
        (adjoin-set (make-code-tree (car leaves) (cadr leaves)) 
                    (cddr leaves))))) 

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree) 
  (cond 
   ((leaf? tree) '()) 
   ((member symbol (symbols tree)) 
    (let ((left (left-branch tree)) (right (right-branch tree))) 
      (if (member symbol (symbols left)) 
          (cons 0 (encode-symbol symbol left)) 
          (cons 1 (encode-symbol symbol right))))) 
   (else (error "bad symbol -- ENCODE-SYMBOL" symbol))))

(define song-tree (generate-huffman-tree
               '((A 2) (NA 16) (BOOM  1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))

(define song
  '(Get a job Sha na na na na na na na na Get a job
        Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))

(length (encode song song-tree)) ;; 84

;; 8 words -> min 3 bits / word

(* 3 (length song)) ;; 108
