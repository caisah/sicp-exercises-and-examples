;; In order to take a closer look at delayed evaluation, we will use the following
;; procedure, which simply returns its argument after printing it:
  (define (show x)
    (display-line x)
    x)
;; What dows the interpreter print in response to evaluationg each expression in the
;; following sequence:
  (define x (stream-map
             show
             (stream-enumerate-interval 0 10)))

  
;; This should be printed (but this implementation doesn't):
;; x
;; 0

(stream-ref x 5) 
;; 1
;; 2
;; 3
;; 4
;; 5

(stream-ref x 7)
;; 6
;; 7
