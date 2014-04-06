;; This file is added by me in order to understand better the concepts.

;; tagging
(define (attach-tag tag contents)
  (cons (tag contents)))

(define (type-tag data)
  (if (pair? data)
      (car data)
      (error "No tag" data)))

(define (contents data)
  (if (pair? data)
      (cdr data)
      (error "No data content")))

;; explicit dispatch
(define pi 3.14)

(define (perimeter shape)
  (cond ((eq? (type-tag shape) 'equil-triangle)
         (* 3 (contents shape)))
        ((eq? (type-tag shape) 'circle)
         (* 2 pi (contents shape)))
        ((eq? (type-tag shape) 'square)
         (* 4 (contents shape)))
        (else (error "Shape not defined!" shape))))

(define (make-equil-triangle side)
  (cons 'equil-triangle side))
(define t (make-equil-triangle 3))

(define (make-circle radius)
  (cons 'circle radius))
(define c (make-circle 3))

(define (make-square side)
  (cons 'square side))
(define s (make-square 3))

(perimeter t) 
(perimeter c)
(perimeter s)

;; directed data programming

(define (perimeter shape)
  (let ((proc (get 'perimeter (type-tag shape))))
    (if proc
        (proc (contents shape))
        (error "Shape not defined"))))


;; generic form that works with any procedure not only with perimeter

(define (generic-dispatch op arg)
  (let ((proc (get op (type-tag arg))))
    (if proc
        (proc (contents arg))
        (error "Shape not defined"))))

(define (perimeter x)
  (generic-dispatch 'perimeter x))
(define (area x)
  (generic-dispatch 'area x))

(define (install-circle)
  (define (area x)
    (* pi pi x))

  (define (perimeter x)
    (* 2 pi x))

  (define (tag x)
    (attach-tag 'circle x))

  (put 'make-circle 'circle
       (lambda (x) (tag x)))
  (put 'area 'circle area)
  (put 'perimeter 'circle perimeter))

(define (make-circle x)
  (get 'make-circle 'circle x)) ;; constructor

(define (area x)
  (generic-dispatch 'area x))


