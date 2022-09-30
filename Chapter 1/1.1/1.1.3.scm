(define (square x) (* x x))

(define (square-sum x y) (+ (square x) (square y)))

(define (largest-square-sum x y z)
  (cond ((and (<= x y) (<= x z)) (square-sum y z))
	((and (<= y x) (<= y z)) (square-sum x z))
	(else (square-sum x y))))

(largest-square-sum 5 3 5)
;; prints 50
