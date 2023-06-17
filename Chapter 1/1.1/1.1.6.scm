(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

;; a normal if statement is special form, so it will only evaluate 1 of it's parameters.
;; as the new-if is no longer special form, it will evaluate both parameters before evaluating the predicate.
;; this means that the program will never terminate as the else-clause infinitely calls itself.
