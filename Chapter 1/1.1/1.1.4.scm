(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; if b is greater than 0, return the result of evaluating a plus b
;; if b is smaller than 0, return the result of evaluating a minus b
;; simply, a plus the absolute value of b
