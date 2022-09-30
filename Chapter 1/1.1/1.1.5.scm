(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

(test 0 (p))

;; applicative order - the operands are evaluated first, and since the expression (p)
;; continually calls itself, it will never stop.

;; normal-order - the expression evaulates first, so evaluates to 0:

(if (= 0 0) 0 (p))

(if #t 0 (p))

0

;; my interpreter uses applicative-order evaluation
