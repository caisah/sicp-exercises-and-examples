;; A semaphore (of size n) is a generalization of a mutex. Like a mutex, a semaphore
;; supports acquire and release operations, but it is more general in that up to n
;; processes can acquire it concurrently. Additional processes that attempt to acquire
;; the semaphore must wait for release operations. Give implementations of semaphores
;; a. in terms of mutexes
;; b. in terms of atomic test-and-set!

;; From https://github.com/felix021/sicp/blob/master/code/3-47.scm#L17

(define (make-semaphore-mutex n)
  (let ((mtx (make-mutex)))
    (define (request m)
      (cond
       ((eq? m 'acquire)
        (lock-mutex mtx)
        (cond
         ((= n 0)
          (unlock-mutex mtx) ; release first
          (request m))
         (else
          (set! n (- n 1))
          (unlock-mutex mtx)))) ;enable other threads
       ((eq? m 'release)
        (lock-mutex mtx)
        (set! n (+ n 1))
        (unlock-mutex mtx))
       (else (error "unknown request" m))))
    request))

; b)

; use test-and-set! to replace the mutex in (a)
; inspired by the solution of
; [Barry Allison](http://wizardbook.wordpress.com/2010/12/19/exercise-3-47/)
;  WARNING: Barry's solution is not right due to some ill-considered situations.

(load "3.4-mutex.scm")

(define (make-semaphore n)
  (let ((cell (list #t)))
    (define (request m)
      (cond
       ((eq? m 'acquire)
        (if (test-and-set! cell)
            (request m)
            (cond
             ((= n 0)
              (clear! cell) ; release first
              (request m))
             (else
              (set! n (- n 1))
              (clear! cell))))) ;enable other threads
       ((eq? m 'release)
        (if (test-and-set! cell)
            (request m)
            (begin
              (set! n (+ n 1))
              (clear! cell))))
       (else (error "unknown request" m))))
    request))

; or use a modified version of test-and-set! (my implementation)
; much simpler, huh :)

(define (test-and-add! lock d)
  (if (= (+ (car lock) d) 0)
      #t
      (begin
        (set-car! lock (+ (car lock) d))
        #f)))

(define (make-semaphore-add n)
  (let ((lock (list n)))
    (define (request m)
      (cond
       ((eq? m 'acquire)
        (if (test-and-add! lock -1)
            (request m)))
       ((eq? m 'release)
        (if (test-and-add! lock 1)
            (request m)))
       (else (error "bad request" m))))
    request))
