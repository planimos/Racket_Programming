#lang racket

(provide (all-defined-out))

;; implementing a for loop behaviour
(define-syntax for 
  (syntax-rules (to do)
    [(for lo to hi do body)
     (let ([l lo]
           [h hi])
       (letrec ([loop (lambda (it)
                        (if (> it h)
                            #t 
                            (begin body (loop (+ it 1)))))])
         (loop l)))]))

; let2 allows up to two local bindings (with let* semantics)
;; than let*
(define-syntax let2
  (syntax-rules ()
    [(let2 () body)
     body]
    [(let2 (var val) body)
     (let ([var val]) body)]
    [(let2 (var1 val1 var2 val2) body)
     (let ([var1 val1])
       (let ([var2 val2])
         body))]))

;; the special ... lets us take any number of arguments 
;; Note: nothing prevents infinite code generation except
;; the macro definer being careful
(define-syntax my-let*
  (syntax-rules ()
    [(my-let* () body)
     body]
    [(my-let* ([var0 val0]
               [var-rest val-rest] ...)
              body)
     (let ([var0 val0])
       (my-let* ([var-rest val-rest] ...)
                body))]))













