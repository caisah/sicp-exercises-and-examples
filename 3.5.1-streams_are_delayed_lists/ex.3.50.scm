;; Complete the following definition, which generalizes stream-map to allow procedures
;; that take multiple arguments, analogous to map in Section 2.2.1.

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(define s1 (cons-stream 1 (cons-stream 2 the-empty-stream)))
(define s2 (cons-stream 2 (cons-stream 4 the-empty-stream)))
(display-stream (stream-map + s1 s2))
